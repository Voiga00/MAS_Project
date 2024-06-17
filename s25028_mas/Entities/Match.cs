using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Match")]
public partial class Match
{
    [Key]
    [Column(TypeName = "INT")]
    public int Match_ID { get; set; }

    [Column(TypeName = "date")]
    public DateTime date { get; set; }

    [Column(TypeName = "INT")]
    public int score { get; set; }

    [Column(TypeName = "INT")]
    public int League_ID_League { get; set; }

    [Column(TypeName = "INT")]
    public int Soccer_field_ID_Soccer_field { get; set; }

    [Column(TypeName = "INT")]
    public int Referee_ID_Referee { get; set; }

    [InverseProperty("Match_Match")]
    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    [ForeignKey("League_ID_League")]
    [InverseProperty("Matches")]
    public virtual League League_ID_LeagueNavigation { get; set; } = null!;

    [ForeignKey("Referee_ID_Referee")]
    [InverseProperty("Matches")]
    public virtual Referee Referee_ID_RefereeNavigation { get; set; } = null!;

    [ForeignKey("Soccer_field_ID_Soccer_field")]
    [InverseProperty("Matches")]
    public virtual Soccer_field Soccer_field_ID_Soccer_fieldNavigation { get; set; } = null!;
}
