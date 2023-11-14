using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CangaLovers.Data
{
    public class Indiretas
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Indireta { get; set; }
        public DateTime Horario { get; set; } = DateTime.Now;
    }
}
