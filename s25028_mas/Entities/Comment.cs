using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace s25028_mas.Entities;

[Table("Comment")]
public partial class Comment
{
    [Key]
    [Column(TypeName = "INT")]
    public int ID_Comment { get; set; }

    public string Content { get; set; } = null!;

    [Column(TypeName = "INT")]
    public int Likes { get; set; }

    [Column(TypeName = "INT")]
    public int Match_Match_ID { get; set; }

    [ForeignKey("Match_Match_ID")]
    [InverseProperty("Comments")]
    public virtual Match Match_Match { get; set; } = null!;
}
