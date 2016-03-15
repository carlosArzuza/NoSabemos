namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Aspirante_OFM : DbMigration
    {
        public override void Up()
        {
            CreateIndex("dbo.Oferta_Mercantil", "CONTRATISTA");
            AddForeignKey("dbo.Oferta_Mercantil", "CONTRATISTA", "dbo.Aspirantes", "ASPIRANTE_ID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Oferta_Mercantil", "CONTRATISTA", "dbo.Aspirantes");
            DropIndex("dbo.Oferta_Mercantil", new[] { "CONTRATISTA" });
        }
    }
}
