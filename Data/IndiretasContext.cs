using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;

namespace CangaLovers.Data
{
    public class IndiretasContext : DbContext
    {
        public IndiretasContext(DbContextOptions<IndiretasContext> options)
          : base(options)
        { 
        }

        public DbSet<Indiretas> Indiretas { get; set; }
    }
}
