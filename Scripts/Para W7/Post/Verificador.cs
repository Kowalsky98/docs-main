using System;
using System.Collections.Generic;
using System.IO;

namespace VerificadorDeInstalacion
{
    public static class Verificador
    {
        private static readonly Dictionary<string, string[]> PROGRAMS = new Dictionary<string, string[]>
        {
            { "GanaT_Bolivares", new string[] { @"C:\GanaT_Bolivares\GanaT.exe" } },
            { "GanaT_Pesos", new string[] { @"C:\GanaT_Pesos\GanaT.exe" } },
            { "GanaT_Dolares", new string[] { @"C:\GanaT_Dolares\GanaT.exe" } },
            { "GanaT", new string[] 
                { 
                    @"C:\%USERPROFILE%\Desktop\GanaT Bolivares.lnk",
                    @"C:\%USERPROFILE%\Desktop\GanaT Dolares.lnk",
                    @"C:\%USERPROFILE%\Desktop\GanaT Pesos.lnk"
                } 
            },
            { "Accesos_Directos", new string[]
                {
                    @"C:\%USERPROFILE%\Desktop\PagoListo.lnk",
                    @"C:\%USERPROFILE%\Desktop\Bemovil.lnk",
                    @"C:\%USERPROFILE%\Desktop\MisMarcadores.lnk",
                    @"C:\%USERPROFILE%\Desktop\SuperGana.lnk",
                    @"C:\%USERPROFILE%\Desktop\Payall.lnk",
                    @"C:\%USERPROFILE%\Desktop\Visitanos en Gana Loterias.lnk"
                }
            },
            { "Serial", new string[]
                {
                    @"C:\%USERPROFILE%\Desktop\KingDeportes.lnk",
                }
            }
        };

        public static List<string> VerificarProgramas(List<string> programas)
        {
            List<string> faltantes = new List<string>();
            foreach (string programa in programas)
            {
                if (PROGRAMS.ContainsKey(programa))
                {
                    bool encontrado = false;
                    foreach (string path in PROGRAMS[programa])
                    {
                        if (File.Exists(Environment.ExpandEnvironmentVariables(path)))
                        {
                            encontrado = true;
                            break;
                        }
                    }
                    if (!encontrado)
                    {
                        faltantes.Add(programa);
                    }
                }
            }
            return faltantes;
        }
    }
}
