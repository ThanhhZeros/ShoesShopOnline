namespace ShoesShopOnline.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SizeGiay")]
    public partial class SizeGiay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SizeGiay()
        {
            ChiTietSanPhams = new HashSet<ChiTietSanPham>();
        }

        [Key]
        public int KichCo { get; set; }

        [StringLength(20)]
        public string Loai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietSanPham> ChiTietSanPhams { get; set; }
    }
}
