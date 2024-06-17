using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities
{
    [Table("Player")]
    public partial class Player
    {
        [Key]
        [Column(TypeName = "INT")]
        public int ID_Player { get; set; }

        [Column(TypeName = "INT")]
        [Range(1, 99, ErrorMessage = "Numer musi być w przedziale od 1 do 99")]
        public int Number { get; set; }

        public string Stronger_Foot { get; set; } = null!;

        [Column(TypeName = "INT")]
        public int Goals { get; set; }

        [Column(TypeName = "INT")]
        public int Assists { get; set; }

        [Column(TypeName = "INT")]
        public int Red_C { get; set; }

        [Column(TypeName = "INT")]
        public int Yellow_Cards { get; set; }

        [Column(TypeName = "INT")]
        public int? Minutes_played { get; set; }

        [Column(TypeName = "INT")]
        public int Matches_played { get; set; }

        [Column(TypeName = "INT")]
        public int Team_ID_team { get; set; }

        [Column(TypeName = "INT")]
        public int Person_ID_Person { get; set; }

        [InverseProperty("Player_ID_PlayerNavigation")]
        public virtual ICollection<Boot> Boots { get; set; } = new List<Boot>();

        [InverseProperty("Player_ID_PlayerNavigation")]
        public virtual ICollection<FieldPlayer> FieldPlayers { get; set; } = new List<FieldPlayer>();

        [InverseProperty("Player_ID_PlayerNavigation")]
        public virtual ICollection<Goalkeeper> Goalkeepers { get; set; } = new List<Goalkeeper>();

        [ForeignKey("Person_ID_Person")]
        [InverseProperty("Players")]
        public virtual Person Person_ID_PersonNavigation { get; set; } = null!;

        [ForeignKey("Team_ID_team")]
        [InverseProperty("Players")]
        public virtual Team Team_ID_teamNavigation { get; set; } = null!;
    }
}