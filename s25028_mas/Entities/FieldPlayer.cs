using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("FieldPlayer")]
public partial class FieldPlayer
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_FieldPlayer { get; set; }

    [Column(TypeName = "INT")]
    public int Position { get; set; }

    [Column(TypeName = "INT")]
    public int Player_ID_Player { get; set; }

    [InverseProperty("FieldPlayer_ID_FieldPlayerNavigation")]
    public virtual ICollection<Defender> Defenders { get; set; } = new List<Defender>();

    [InverseProperty("FieldPlayer_ID_FieldPlayerNavigation")]
    public virtual ICollection<Midfielder> Midfielders { get; set; } = new List<Midfielder>();

    [ForeignKey("Player_ID_Player")]
    [InverseProperty("FieldPlayers")]
    public virtual Player Player_ID_PlayerNavigation { get; set; } = null!;

    [InverseProperty("FieldPlayer_ID_FieldPlayerNavigation")]
    public virtual ICollection<Striker> Strikers { get; set; } = new List<Striker>();
}
