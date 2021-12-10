namespace ShoesShopOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietHoaDon")]
    public partial class ChiTietHoaDon
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaHD { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string MaAnh { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(10)]
        public string KichCo { get; set; }

        public int SoluongMua { get; set; }

        public virtual HoaDon HoaDon { get; set; }

        public virtual ChiTietSanPham ChiTietSanPham { get; set; }
    }
}
