namespace ShoesShopOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LienHe")]
    public partial class LienHe
    {
        [Key]
        public int MaLienHe { get; set; }

        [StringLength(20)]
        public string SDTLienHe { get; set; }

        [StringLength(300)]
        public string DiaChi { get; set; }

        [StringLength(50)]
        public string Email { get; set; }
    }
}
