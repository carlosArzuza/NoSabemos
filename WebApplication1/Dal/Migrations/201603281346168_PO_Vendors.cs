namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PO_Vendors : DbMigration
    {
        public override void Up()
        {
            CreateIndex("dbo.Orden_Compra", "PROVEEDOR");
            AddForeignKey("dbo.Orden_Compra", "PROVEEDOR", "dbo.Aspirantes", "ASPIRANTE_ID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Orden_Compra", "PROVEEDOR", "dbo.Aspirantes");
            DropIndex("dbo.Orden_Compra", new[] { "PROVEEDOR" });
        }
    }
}
