namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class proce_proyec : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Proceso_Competitivo", "PROYECTO_COMPETITIVO", "dbo.Proyectoes");
            AddColumn("dbo.Proceso_Competitivo", "proyecto_procompetitivo_PROYEC_ID", c => c.Int());
            AddColumn("dbo.Proyectoes", "proyecto_proceso_ID_COMPETITIVO", c => c.Int());
            CreateIndex("dbo.Proceso_Competitivo", "proyecto_procompetitivo_PROYEC_ID");
            CreateIndex("dbo.Proyectoes", "proyecto_proceso_ID_COMPETITIVO");
            AddForeignKey("dbo.Proyectoes", "proyecto_proceso_ID_COMPETITIVO", "dbo.Proceso_Competitivo", "ID_COMPETITIVO");
            AddForeignKey("dbo.Proceso_Competitivo", "proyecto_procompetitivo_PROYEC_ID", "dbo.Proyectoes", "PROYEC_ID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Proceso_Competitivo", "proyecto_procompetitivo_PROYEC_ID", "dbo.Proyectoes");
            DropForeignKey("dbo.Proyectoes", "proyecto_proceso_ID_COMPETITIVO", "dbo.Proceso_Competitivo");
            DropIndex("dbo.Proyectoes", new[] { "proyecto_proceso_ID_COMPETITIVO" });
            DropIndex("dbo.Proceso_Competitivo", new[] { "proyecto_procompetitivo_PROYEC_ID" });
            DropColumn("dbo.Proyectoes", "proyecto_proceso_ID_COMPETITIVO");
            DropColumn("dbo.Proceso_Competitivo", "proyecto_procompetitivo_PROYEC_ID");
            AddForeignKey("dbo.Proceso_Competitivo", "PROYECTO_COMPETITIVO", "dbo.Proyectoes", "PROYEC_ID", cascadeDelete: true);
        }
    }
}
