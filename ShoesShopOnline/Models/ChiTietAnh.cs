namespace ShoesShopOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietAnh")]
    public partial class ChiTietAnh
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDAnh { get; set; }

        [StringLength(10)]
        public string MaAnh { get; set; }

        [StringLength(300)]
        public string AnhChiTiet { get; set; }

        public virtual AnhMoTa AnhMoTa { get; set; }
    }
}
