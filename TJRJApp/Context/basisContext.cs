using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using TJRJApp.Models;

namespace TJRJApp.Context;

public partial class BasisContext : DbContext
{
    public BasisContext()
    {
    }

    public BasisContext(DbContextOptions<BasisContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Assunto> Assuntos { get; set; }

    public virtual DbSet<Autor> Autors { get; set; }

    public virtual DbSet<Livro> Livros { get; set; }

    public virtual DbSet<LivroAquisicao> LivroAquisicaos { get; set; }

    public virtual DbSet<LivroAssunto> LivroAssuntos { get; set; }

    public virtual DbSet<LivroAutor> LivroAutors { get; set; }

    public virtual DbSet<TipoAquisicao> TipoAquisicaos { get; set; }
    public virtual DbSet<LivrosView> LivrosView { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;Database=basisbd;USER ID=SA;PASSWORD=!@#$%@2025Sa; TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Assunto>(entity =>
        {
            entity.HasKey(e => e.CodAs).HasName("PK__Assunto__F415976199A32A25");

            entity.ToTable("Assunto");

            entity.Property(e => e.Descricao)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Autor>(entity =>
        {
            entity.HasKey(e => e.AutorCodAu).HasName("PK__Autor__8FB56B02A55DE0A1");

            entity.ToTable("Autor");

            entity.Property(e => e.AutorCodAu).HasColumnName("Autor_CodAu");
            entity.Property(e => e.Nome)
                .HasMaxLength(40)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Livro>(entity =>
        {
            entity.HasKey(e => e.LivroCodl).HasName("PK__Livro__1544297319628FCE");

            entity.ToTable("Livro");

            entity.Property(e => e.LivroCodl).HasColumnName("Livro_Codl");
            entity.Property(e => e.AnoPublicacao)
                .HasMaxLength(4)
                .IsUnicode(false);
            entity.Property(e => e.Editora)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.Titulo)
                .HasMaxLength(40)
                .IsUnicode(false);
        });

        modelBuilder.Entity<LivroAquisicao>(entity =>
        {
            entity.HasKey(e => e.CodAq).HasName("PK__Livro_Aq__F41597634FE4CB15");

            entity.ToTable("Livro_Aquisicao");

            entity.Property(e => e.LivroCodl).HasColumnName("Livro_Codl");
            entity.Property(e => e.TipoAquisicaoCod).HasColumnName("Tipo_Aquisicao_Cod");
            entity.Property(e => e.Valor).HasColumnType("numeric(18, 2)");

            entity.HasOne(d => d.LivroCodlNavigation).WithMany(p => p.LivroAquisicaos)
                .HasForeignKey(d => d.LivroCodl)
                .HasConstraintName("FK_Livro_Aquisicao_Livro");

            entity.HasOne(d => d.TipoAquisicaoCodNavigation).WithMany(p => p.LivroAquisicaos)
                .HasForeignKey(d => d.TipoAquisicaoCod)
                .HasConstraintName("FK_Livro_Aquisicao_Tipo_Aquisicao");
        });

        modelBuilder.Entity<LivroAssunto>(entity =>
        {
            entity.HasKey(e => e.LivroAssuntoCod).HasName("PK__Livro_As__E393E5A1480392DE");

            entity.ToTable("Livro_Assunto");

            entity.Property(e => e.LivroAssuntoCod).HasColumnName("Livro_Assunto_Cod");
            entity.Property(e => e.AssuntoCodAs).HasColumnName("Assunto_CodAs");
            entity.Property(e => e.LivroCodl).HasColumnName("Livro_Codl");

            //entity.HasOne(d => d.AssuntoCodAsNavigation).WithMany(p => p.LivroAssuntos)
            //    .HasForeignKey(d => d.AssuntoCodAs)
            //    .HasConstraintName("FK_Livro_Assunto_Assunto");

            entity.HasOne(d => d.LivroCodlNavigation).WithMany(p => p.LivroAssuntos)
                .HasForeignKey(d => d.LivroCodl)
                .HasConstraintName("FK_Livro_Assunto_Livro");
        });

        modelBuilder.Entity<LivroAutor>(entity =>
        {
            entity.HasKey(e => e.LivroAutorCod).HasName("PK__Livro_Au__CAFEA06DBFDB5833");

            entity.ToTable("Livro_Autor");

            entity.Property(e => e.LivroAutorCod).HasColumnName("Livro_Autor_Cod");
            entity.Property(e => e.AutorCodAu).HasColumnName("Autor_CodAu");
            entity.Property(e => e.LivroCodl).HasColumnName("Livro_Codl");

            //entity.HasOne(d => d.AutorCodAuNavigation).WithMany(p => p.LivroAutors)
            //    .HasForeignKey(d => d.AutorCodAu)
            //    .HasConstraintName("FK_Livro_Autor_Autor");

            entity.HasOne(d => d.LivroCodlNavigation).WithMany(p => p.LivroAutors)
                .HasForeignKey(d => d.LivroCodl)
                .HasConstraintName("FK_Livro_Autor_Livro");
        });

        modelBuilder.Entity<TipoAquisicao>(entity =>
        {
            entity.HasKey(e => e.TipoAquisicaoCod).HasName("PK__Tipo_Aqu__AD52091BFDF43F63");

            entity.ToTable("Tipo_Aquisicao");

            entity.Property(e => e.TipoAquisicaoCod).HasColumnName("Tipo_Aquisicao_Cod");
            entity.Property(e => e.Descricao)
                .HasMaxLength(50)
                .IsUnicode(false);
        });
        modelBuilder.Entity<LivrosView>(
           eb =>
           {
               eb.HasNoKey();
               eb.ToView("View_BlogPostCounts");
               eb.Property(v => v.Titulo).HasColumnName("Titulo");
           });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
