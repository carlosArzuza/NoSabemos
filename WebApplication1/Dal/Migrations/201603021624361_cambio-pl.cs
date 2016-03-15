namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cambiopl : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Polizas", "oferta_mercantil_ID_OFERTA", "dbo.Oferta_Mercantil");
            DropIndex("dbo.Polizas", new[] { "oferta_mercantil_ID_OFERTA" });
            DropColumn("dbo.Polizas", "oferta_mercantil_ID_OFERTA");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Polizas", "oferta_mercantil_ID_OFERTA", c => c.Int());
            CreateIndex("dbo.Polizas", "oferta_mercantil_ID_OFERTA");
            AddForeignKey("dbo.Polizas", "oferta_mercantil_ID_OFERTA", "dbo.Oferta_Mercantil", "ID_OFERTA");
        }
    }
}
