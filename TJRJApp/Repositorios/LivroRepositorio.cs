using Microsoft.EntityFrameworkCore;
using TJRJApp.Context;
using TJRJApp.Models;

namespace TJRJApp.Repositorios
{
    public class LivroRepositorio
    {
        private BasisContext _context;

        public int MyProperty { get; set; }
        public LivroRepositorio()
        {
            _context = new BasisContext();
        }
        public List<TipoAquisicao> GetTipoAquisicoes()
        {
            return _context.Set<TipoAquisicao>().ToList();
        }
        public List<Assunto> GetAssuntos()
        {
            return _context.Set<Assunto>().ToList();
        }
        public List<Autor> GetAutores()
        {
            return _context.Set<Autor>().ToList();
        }

        public List<LivrosView> GetReportView()
        {
            var viewLivros = _context.LivrosView.FromSqlRaw("SELECT * FROM [LivrosView]").ToList();
            return viewLivros;
        }


    }
}
