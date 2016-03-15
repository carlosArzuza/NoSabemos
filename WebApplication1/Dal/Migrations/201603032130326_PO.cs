namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class PO : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Orden_Compra",
                c => new
                    {
                        NUMERO_PO = c.String(nullable: false, maxLength: 128),
                        ID_PO = c.Int(nullable: false, identity: true),
                        FECHA_CREACION = c.String(),
                        PROVEEDOR = c.Int(nullable: false),
                        JURISDICCION_PO = c.String(),
                        AFE_PO = c.String(),
                        NO_OFM = c.String(),
                        ESTADO_PO = c.String(),
                    })
                .PrimaryKey(t => t.NUMERO_PO);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Orden_Compra");
        }
    }
}
