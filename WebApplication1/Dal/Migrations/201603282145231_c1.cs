namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class c1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Orden_Compra_detalle", "LINEA", c => c.String());
            AddColumn("dbo.Orden_Compra_detalle", "DESCRIPCION", c => c.String());
            AddColumn("dbo.Orden_Compra_detalle", "UNIDAD", c => c.String());
            AddColumn("dbo.Orden_Compra_detalle", "VALORUNITARIO", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Orden_Compra_detalle", "VALORTOTAL", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            DropColumn("dbo.Orden_Compra_detalle", "PRODUCTO");
            DropColumn("dbo.Orden_Compra_detalle", "UNIDAD_PO");
            DropColumn("dbo.Orden_Compra_detalle", "VALOR_UNI");
            DropColumn("dbo.Orden_Compra_detalle", "VALOR_TOTAL");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Orden_Compra_detalle", "VALOR_TOTAL", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Orden_Compra_detalle", "VALOR_UNI", c => c.Decimal(nullable: false, precision: 18, scale: 2));
            AddColumn("dbo.Orden_Compra_detalle", "UNIDAD_PO", c => c.String());
            AddColumn("dbo.Orden_Compra_detalle", "PRODUCTO", c => c.String());
            DropColumn("dbo.Orden_Compra_detalle", "VALORTOTAL");
            DropColumn("dbo.Orden_Compra_detalle", "VALORUNITARIO");
            DropColumn("dbo.Orden_Compra_detalle", "UNIDAD");
            DropColumn("dbo.Orden_Compra_detalle", "DESCRIPCION");
            DropColumn("dbo.Orden_Compra_detalle", "LINEA");
        }
    }
}
