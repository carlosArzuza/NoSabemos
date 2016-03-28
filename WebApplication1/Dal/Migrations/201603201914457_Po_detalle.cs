namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Po_detalle : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Orden_Compra_detalle",
                c => new
                    {
                        ID_PO_DETALLE = c.Int(nullable: false, identity: true),
                        NUMERO_POD = c.String(maxLength: 128),
                        PRODUCTO = c.String(),
                        CANTIDAD = c.Decimal(nullable: false, precision: 18, scale: 2),
                        UNIDAD_PO = c.String(),
                        VALOR_UNI = c.Decimal(nullable: false, precision: 18, scale: 2),
                        VALOR_TOTAL = c.Decimal(nullable: false, precision: 18, scale: 2),
                    })
                .PrimaryKey(t => t.ID_PO_DETALLE)
                .ForeignKey("dbo.Orden_Compra", t => t.NUMERO_POD)
                .Index(t => t.NUMERO_POD);
            
            AddColumn("dbo.Orden_Compra", "TOTAL_PO", c => c.Decimal(nullable: false, precision: 18, scale: 2));
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Orden_Compra_detalle", "NUMERO_POD", "dbo.Orden_Compra");
            DropIndex("dbo.Orden_Compra_detalle", new[] { "NUMERO_POD" });
            DropColumn("dbo.Orden_Compra", "TOTAL_PO");
            DropTable("dbo.Orden_Compra_detalle");
        }
    }
}
