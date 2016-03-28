namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class corecciones : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Proceso_Competitivo", "FECHA_INICIO", c => c.String());
            AddColumn("dbo.Aspirantes", "CUIDAD", c => c.String());
            DropColumn("dbo.Proceso_Competitivo", "FECHA_INICO");
            DropColumn("dbo.Aspirantes", "CIUDAD");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Aspirantes", "CIUDAD", c => c.String());
            AddColumn("dbo.Proceso_Competitivo", "FECHA_INICO", c => c.String());
            DropColumn("dbo.Aspirantes", "CUIDAD");
            DropColumn("dbo.Proceso_Competitivo", "FECHA_INICIO");
        }
    }
}
