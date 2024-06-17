using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Team")]
public partial class Team
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_team { get; set; }

    [Column(TypeName = "INT")]
    public int points { get; set; }

    [Column(TypeName = "INT")]
    public int League_ID_League { get; set; }

    [InverseProperty("Team_ID_teamNavigation")]
    public virtual ICollection<Coach> Coaches { get; set; } = new List<Coach>();

    [ForeignKey("League_ID_League")]
    [InverseProperty("Teams")]
    public virtual League League_ID_LeagueNavigation { get; set; } = null!;

    [InverseProperty("Team_ID_teamNavigation")]
    public virtual ICollection<Player> Players { get; set; } = new List<Player>();
}
