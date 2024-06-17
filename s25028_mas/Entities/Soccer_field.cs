using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Soccer_field")]
public partial class Soccer_field
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Soccer_field { get; set; }

    [Column(TypeName = "INT")]
    public int StandCapacity { get; set; }

    public string Address { get; set; } = null!;

    [InverseProperty("Soccer_field_ID_Soccer_fieldNavigation")]
    public virtual ICollection<Match> Matches { get; set; } = new List<Match>();
}
