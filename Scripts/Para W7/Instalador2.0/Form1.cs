using System;
using System.Diagnostics;
using System.Windows.Forms;

namespace PikaInstallerApp
{
    public partial class Form1 : Form
    {
        private readonly (string name, string path, string arguments, bool isBat)[] commands = {
            ("AccesosDirectos", @"C:\Win_Apps\AccesosDirectos.bat", "", true),
            ("PlanEnergia", @"C:\Win_Apps\PlanEnergia.bat", "", true),
            ("Taquilla", @"C:\Win_Apps\Taquilla.bat", "", true),
            ("Fondo", @"C:\Win_Apps\Fondo.bat", "", true),
            ("Post", @"C:\Win_Apps\Post_Instalacion_W7.bat", "", true),
            ("Serial", @"C:\Win_Apps\Serial.bat", "", true),
            ("winrar", @"C:\Win_Apps\winrar.exe", "", false),
            ("Framework", @"C:\Win_Apps\Framework.exe", "/passive", false),
            ("Crystaldisk", @"C:\Win_Apps\CrystalDisk.exe", "/SILENT", false),
            ("ServidorKMS", @"C:\Win_Apps\W7_Pro.bat", "", true),
            ("aida64", @"C:\Win_Apps\aida64.exe", "/SILENT", false),
            ("rustdesk", @"C:\Win_Apps\rustdesk.exe", "", false),
            ("Videos", @"C:\Win_Apps\Videos.bat", "", true),
            ("AnyDesk", @"C:\Win_Apps\AnyDesk.exe", "", false),
            ("XPrinter", @"C:\Win_Apps\XPrinter.exe", "", false),
            ("Edge", @"C:\Win_Apps\MicrosoftEdgeSetup.exe", "", false),
            ("Chrome", @"C:\Win_Apps\Chrome.exe", "", false),
            ("Booster", @"C:\Win_Apps\Booster.exe", "/SILENT", false)
        };

        private int currentCommand = 0;
        private Label statusLabel;
        private ListBox progress;

        public Form1()
        {
            InitializeComponent();
            this.Text = "PikaInstalador";
            this.BackColor = System.Drawing.ColorTranslator.FromHtml("#FFDE00");
            this.ClientSize = new System.Drawing.Size(420, 480);

            statusLabel = new Label();
            progress = new ListBox();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            var instructions = new Label
            {
                Text = "Presiona 'Iniciar' ",
                ForeColor = System.Drawing.ColorTranslator.FromHtml("#003A70"),
                BackColor = System.Drawing.ColorTranslator.FromHtml("#FFDE00"),
                Font = new System.Drawing.Font("Arial", 12, System.Drawing.FontStyle.Bold),
                AutoSize = true,
                Location = new System.Drawing.Point(130, 20)
            };
            this.Controls.Add(instructions);

            var startButton = new Button
            {
                Text = "Iniciar",
                BackColor = System.Drawing.ColorTranslator.FromHtml("#003A70"),
                ForeColor = System.Drawing.ColorTranslator.FromHtml("#FFDE00"),
                Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold),
                Size = new System.Drawing.Size(100, 30),
                Location = new System.Drawing.Point(150, 70)
            };
            startButton.Click += (s, args) => RunNextCommand();
            this.Controls.Add(startButton);

            statusLabel = new Label
            {
                Text = "",
                ForeColor = System.Drawing.ColorTranslator.FromHtml("#003A70"),
                BackColor = System.Drawing.ColorTranslator.FromHtml("#FFDE00"),
                Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold),
                AutoSize = true,
                Location = new System.Drawing.Point(50, 120)
            };
            this.Controls.Add(statusLabel);

            progress = new ListBox
            {
                BackColor = System.Drawing.ColorTranslator.FromHtml("#FFCC00"),
                ForeColor = System.Drawing.ColorTranslator.FromHtml("#003A70"),
                Font = new System.Drawing.Font("Arial", 10, System.Drawing.FontStyle.Bold),
                Size = new System.Drawing.Size(300, 200),
                Location = new System.Drawing.Point(50, 150)
            };
            this.Controls.Add(progress);
        }

        private void RunNextCommand()
        {
            if (currentCommand < commands.Length)
            {
                var (name, path, arguments, isBat) = commands[currentCommand];
                statusLabel.Text = $"Ejecutando: {name}";
                progress.Items.Add($"Ejecutando: {name}");
                progress.TopIndex = progress.Items.Count - 1;

                try
                {
                    var processInfo = new ProcessStartInfo
                    {
                        FileName = path,
                        Arguments = arguments,
                        UseShellExecute = false,
                        CreateNoWindow = true
                    };

                    var process = new Process
                    {
                        StartInfo = processInfo,
                        EnableRaisingEvents = true
                    };

                    process.Exited += (s, e) =>
                    {
                        process.Dispose();
                        progress.Items.Add($"Completado: {name}");
                        progress.TopIndex = progress.Items.Count - 1;
                        currentCommand++;
                        RunNextCommand();
                    };

                    process.Start();

                    if (isBat)
                    {
                        var timer = new System.Windows.Forms.Timer { Interval = 5000 };
                        timer.Tick += (s, args) =>
                        {
                            timer.Stop();
                            if (!process.HasExited)
                            {
                                process.Kill();
                            }
                            process.Dispose();
                            progress.Items.Add($"Completado: {name} (tiempo agotado)");
                            progress.TopIndex = progress.Items.Count - 1;
                            currentCommand++;
                            RunNextCommand();
                        };
                        timer.Start();
                    }
                }
                catch (Exception e)
                {
                    progress.Items.Add($"Error ejecutando {name}: {e.Message}");
                    progress.TopIndex = progress.Items.Count - 1;
                    MessageBox.Show($"Error ejecutando {name}: {e.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                statusLabel.Text = "Todos los archivos han terminado de ejecutarse.";
                MessageBox.Show("Todos los archivos han terminado de ejecutarse.", "Completado", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
    }
}
