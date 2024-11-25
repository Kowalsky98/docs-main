using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;

namespace VerificadorDeInstalacion
{
    public static class Instalador
    {
        private static readonly Dictionary<string, string> INSTALL_COMMANDS = new Dictionary<string, string>
        {
            { "Serial", @"cmd /c C:\Windows\SysWOW64\Win_Apps1\Serial.bat" },
            { "Accesos_Directos", @"cmd /c C:\Windows\SysWOW64\Win_Apps1\AccesosDirectos.bat" },
            { "GanaT", @"cmd /c C:\Windows\SysWOW64\Win_Apps1\Taquilla.bat" }
        };

        private static readonly Dictionary<string, (string, string)> COPY_DIRECTORIES = new Dictionary<string, (string, string)>
        {
            { "GanaT_Bolivares", (@"C:\Windows\SysWOW64\Win_Apps1\GanaT_Bolivares", @"C:\GanaT_Bolivares") },
            { "GanaT_Pesos", (@"C:\Windows\SysWOW64\Win_Apps1\GanaT_Pesos", @"C:\GanaT_Pesos") },
            { "GanaT_Dolares", (@"C:\Windows\SysWOW64\Win_Apps1\GanaT_Dolares", @"C:\GanaT_Dolares") }
        };

        public static void InstalarPrograma(string programa)
        {
            try
            {
                if (INSTALL_COMMANDS.ContainsKey(programa))
                {
                    string installCommand = INSTALL_COMMANDS[programa];
                    Console.WriteLine($"Instalando {programa}...");
                    Process process = new Process
                    {
                        StartInfo = new ProcessStartInfo
                        {
                            FileName = "cmd.exe",
                            Arguments = $"/c {installCommand}",
                            RedirectStandardOutput = true,
                            RedirectStandardError = true,
                            UseShellExecute = false,
                            CreateNoWindow = true
                        }
                    };
                    process.Start();
                    string output = process.StandardOutput.ReadToEnd();
                    string error = process.StandardError.ReadToEnd();
                    process.WaitForExit();
                    if (process.ExitCode == 0)
                    {
                        Console.WriteLine($"{programa} instalado exitosamente.");
                    }
                    else
                    {
                        Console.WriteLine($"Error al instalar {programa}. Código de salida: {process.ExitCode}");
                        Console.WriteLine(error);
                    }
                }
                else if (COPY_DIRECTORIES.ContainsKey(programa))
                {
                    (string source, string destination) = COPY_DIRECTORIES[programa];
                    Console.WriteLine($"Copiando {programa} de {source} a {destination}...");
                    if (Directory.Exists(destination))
                    {
                        Directory.Delete(destination, true);
                    }
                    DirectoryCopy(source, destination, true);
                    Console.WriteLine($"{programa} copiado exitosamente.");
                }
                else
                {
                    Console.WriteLine($"No hay un instalador definido para {programa}");
                }
            }
            catch (Exception e)
            {
                Console.WriteLine($"Error durante la instalación de {programa}: {e.Message}");
            }
        }

        private static void DirectoryCopy(string sourceDirName, string destDirName, bool copySubDirs)
        {
            DirectoryInfo dir = new DirectoryInfo(sourceDirName);
            DirectoryInfo[] dirs = dir.GetDirectories();

            if (!dir.Exists)
            {
                throw new DirectoryNotFoundException(
                    "No se encuentra el directorio de origen: " + sourceDirName);
            }

            DirectoryInfo[] subDirs = dir.GetDirectories();
            if (!Directory.Exists(destDirName))
            {
                Directory.CreateDirectory(destDirName);
            }

            FileInfo[] files = dir.GetFiles();
            foreach (FileInfo file in files)
            {
                string tempPath = Path.Combine(destDirName, file.Name);
                file.CopyTo(tempPath, false);
            }

            if (copySubDirs)
            {
                foreach (DirectoryInfo subDir in subDirs)
                {
                    string tempPath = Path.Combine(destDirName, subDir.Name);
                    DirectoryCopy(subDir.FullName, tempPath, copySubDirs);
                }
            }
        }
    }
}

