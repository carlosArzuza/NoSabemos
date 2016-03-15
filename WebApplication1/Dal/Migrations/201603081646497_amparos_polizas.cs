namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class amparos_polizas : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Amparos_Polizas",
                c => new
                    {
                        ID_AMP = c.Int(nullable: false, identity: true),
                        NOMBRE_AMP = c.String(),
                        TIPO_AMP = c.String(),
                        ESTADO_AMP = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.ID_AMP);
            
            AddColumn("dbo.Polizas", "Amparos_ID_AMP", c => c.Int());
            AlterColumn("dbo.Polizas", "ASEGURADORA", c => c.Int(nullable: false));
            AlterColumn("dbo.Polizas", "TIPO_POLIZA", c => c.Int(nullable: false));
            CreateIndex("dbo.Polizas", "Amparos_ID_AMP");
            AddForeignKey("dbo.Polizas", "Amparos_ID_AMP", "dbo.Amparos_Polizas", "ID_AMP");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Polizas", "Amparos_ID_AMP", "dbo.Amparos_Polizas");
            DropIndex("dbo.Polizas", new[] { "Amparos_ID_AMP" });
            AlterColumn("dbo.Polizas", "TIPO_POLIZA", c => c.String());
            AlterColumn("dbo.Polizas", "ASEGURADORA", c => c.String());
            DropColumn("dbo.Polizas", "Amparos_ID_AMP");
            DropTable("dbo.Amparos_Polizas");
        }
    }
}
