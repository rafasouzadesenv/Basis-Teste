using FastReport.Export.PdfSimple;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TJRJApp.Repositorios;

namespace TJRJApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ReportController : ControllerBase
    {
        public readonly IWebHostEnvironment _webHostEnv;
        private readonly LivroRepositorio _livroRepository;
       
        public ReportController(IWebHostEnvironment webHostEnv)
        {
            _webHostEnv = webHostEnv;
            _livroRepository = new LivroRepositorio();
        }

        [Route("CreateReport")]
        public IActionResult CreateReport()
        {
            var caminhoReport = Path.Combine(_webHostEnv.WebRootPath, @"reports\ReportMvc.frx");
            var reportFile = caminhoReport;
            var freport = new FastReport.Report();
            var livrosList = _livroRepository.GetReportView() ;

            freport.Dictionary.RegisterBusinessObject(livrosList, "LivroList", 10, true);
            freport.Report.Save(reportFile);

            return Ok($" Relatorio gerado : {caminhoReport}");
        }
        [HttpGet("RelatorioReport")]
        public IActionResult RelatorioReport()
        {
            var caminhoReport = Path.Combine(_webHostEnv.WebRootPath, @"reports\ReportMvc.frx");
            var reportFile = caminhoReport;
            var freport = new FastReport.Report();
            var livrosList = _livroRepository.GetReportView();

            freport.Report.Load(reportFile);
            freport.Dictionary.RegisterBusinessObject(livrosList, "livroList", 10, true);
            //freport.Report.Save(reportFile);
            freport.Prepare();

            var pdfExport = new PDFSimpleExport();

            using MemoryStream ms = new MemoryStream();
            pdfExport.Export(freport, ms);
            ms.Flush();

            return File(ms.ToArray(), "application/pdf");
            //return Ok($"Relatorio gerado: {caminhoReport}");
        }
    }
}
