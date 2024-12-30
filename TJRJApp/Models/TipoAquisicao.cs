using System;
using System.Collections.Generic;

namespace TJRJApp.Models;

public partial class TipoAquisicao
{
    public int TipoAquisicaoCod { get; set; }

    public string? Descricao { get; set; }

    public virtual ICollection<LivroAquisicao> LivroAquisicaos { get; set; } = new List<LivroAquisicao>();
}
