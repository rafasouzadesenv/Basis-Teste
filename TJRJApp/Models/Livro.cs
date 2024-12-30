using System;
using System.Collections.Generic;

namespace TJRJApp.Models;

public partial class Livro
{
    public int LivroCodl { get; set; }

    public string? Titulo { get; set; }

    public string? Editora { get; set; }

    public int? Edicao { get; set; }

    public string? AnoPublicacao { get; set; }

    public virtual ICollection<LivroAquisicao> LivroAquisicaos { get; set; } = new List<LivroAquisicao>();

    public virtual ICollection<LivroAssunto> LivroAssuntos { get; set; } = new List<LivroAssunto>();

    public virtual ICollection<LivroAutor> LivroAutors { get; set; } = new List<LivroAutor>();
}
