using Microsoft.EntityFrameworkCore;
using s25028_mas.Entities;

namespace s25028_mas.Context
{
    public partial class MyDbContext : DbContext
    {
        public MyDbContext()
        {
        }

        public MyDbContext(DbContextOptions<MyDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Boot> Boots { get; set; }
        public virtual DbSet<Coach> Coaches { get; set; }
        public virtual DbSet<Comment> Comments { get; set; }
        public virtual DbSet<Defender> Defenders { get; set; }
        public virtual DbSet<FieldPlayer> FieldPlayers { get; set; }
        public virtual DbSet<Goalkeeper> Goalkeepers { get; set; }
        public virtual DbSet<League> Leagues { get; set; }
        public virtual DbSet<Match> Matches { get; set; }
        public virtual DbSet<Midfielder> Midfielders { get; set; }
        public virtual DbSet<Person> People { get; set; }
        public virtual DbSet<Player> Players { get; set; }
        public virtual DbSet<Referee> Referees { get; set; }
        public virtual DbSet<Soccer_field> Soccer_fields { get; set; }
        public virtual DbSet<Striker> Strikers { get; set; }
        public virtual DbSet<Team> Teams { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Boot>(entity =>
            {
                entity.Property(e => e.ID_Boots).ValueGeneratedNever();

                entity.HasOne(d => d.Player_ID_PlayerNavigation).WithMany(p => p.Boots).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Coach>(entity =>
            {
                entity.Property(e => e.ID_Coach).ValueGeneratedNever();

                entity.HasOne(d => d.Person_ID_PersonNavigation).WithMany(p => p.Coaches).OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Team_ID_teamNavigation).WithMany(p => p.Coaches).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Comment>(entity =>
            {
                entity.Property(e => e.ID_Comment).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Match_Match).WithMany(p => p.Comments).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Defender>(entity =>
            {
                entity.Property(e => e.ID_Defender).ValueGeneratedOnAdd();

                entity.HasOne(d => d.FieldPlayer_ID_FieldPlayerNavigation).WithMany(p => p.Defenders).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<FieldPlayer>(entity =>
            {
                entity.Property(e => e.ID_FieldPlayer).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Player_ID_PlayerNavigation).WithMany(p => p.FieldPlayers).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Goalkeeper>(entity =>
            {
                entity.Property(e => e.ID_Goalkeeper).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Player_ID_PlayerNavigation).WithMany(p => p.Goalkeepers).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<League>(entity =>
            {
                entity.Property(e => e.ID_League).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Match>(entity =>
            {
                entity.Property(e => e.Match_ID).ValueGeneratedOnAdd();

                entity.HasOne(d => d.League_ID_LeagueNavigation).WithMany(p => p.Matches).OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Referee_ID_RefereeNavigation).WithMany(p => p.Matches).OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Soccer_field_ID_Soccer_fieldNavigation).WithMany(p => p.Matches).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Midfielder>(entity =>
            {
                entity.Property(e => e.ID_Midfielder).ValueGeneratedOnAdd();

                entity.HasOne(d => d.FieldPlayer_ID_FieldPlayerNavigation).WithMany(p => p.Midfielders).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Person>(entity =>
            {
                entity.Property(e => e.ID_Person).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Player>(entity =>
            {
                entity.HasKey(e => e.ID_Player);

                entity.HasOne(d => d.Person_ID_PersonNavigation)
                    .WithMany(p => p.Players)
                    .HasForeignKey(d => d.Person_ID_Person)
                    .OnDelete(DeleteBehavior.ClientSetNull);

                entity.HasOne(d => d.Team_ID_teamNavigation)
                    .WithMany(p => p.Players)
                    .HasForeignKey(d => d.Team_ID_team)
                    .OnDelete(DeleteBehavior.ClientSetNull);
            });


            modelBuilder.Entity<Referee>(entity =>
            {
                entity.Property(e => e.ID_Referee).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Person_ID_PersonNavigation).WithMany(p => p.Referees).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Soccer_field>(entity =>
            {
                entity.Property(e => e.ID_Soccer_field).ValueGeneratedOnAdd();
            });

            modelBuilder.Entity<Striker>(entity =>
            {
                entity.Property(e => e.ID_Striker).ValueGeneratedOnAdd();

                entity.HasOne(d => d.FieldPlayer_ID_FieldPlayerNavigation).WithMany(p => p.Strikers).OnDelete(DeleteBehavior.ClientSetNull);
            });

            modelBuilder.Entity<Team>(entity =>
            {
                entity.Property(e => e.ID_team).ValueGeneratedOnAdd();

                entity.HasOne(d => d.League_ID_LeagueNavigation).WithMany(p => p.Teams).OnDelete(DeleteBehavior.ClientSetNull);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
