using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("League")]
public partial class League
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_League { get; set; }

    [Column(TypeName = "INT")]
    public int round { get; set; }

    [InverseProperty("League_ID_LeagueNavigation")]
    public virtual ICollection<Match> Matches { get; set; } = new List<Match>();

    [InverseProperty("League_ID_LeagueNavigation")]
    public virtual ICollection<Team> Teams { get; set; } = new List<Team>();
}
