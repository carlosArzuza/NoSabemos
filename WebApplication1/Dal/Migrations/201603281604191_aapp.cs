namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class aapp : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Proceso_Competitivo", "proyecto_proceso_PROYEC_ID", c => c.Int());
            CreateIndex("dbo.Proceso_Competitivo", "proyecto_proceso_PROYEC_ID");
            AddForeignKey("dbo.Proceso_Competitivo", "proyecto_proceso_PROYEC_ID", "dbo.Proyectoes", "PROYEC_ID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Proceso_Competitivo", "proyecto_proceso_PROYEC_ID", "dbo.Proyectoes");
            DropIndex("dbo.Proceso_Competitivo", new[] { "proyecto_proceso_PROYEC_ID" });
            DropColumn("dbo.Proceso_Competitivo", "proyecto_proceso_PROYEC_ID");
        }
    }
}
