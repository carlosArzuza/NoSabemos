namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cambio_polizas : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Polizas", "Amparos_ID_AMP", "dbo.Amparos_Polizas");
            DropIndex("dbo.Polizas", new[] { "Amparos_ID_AMP" });
            DropColumn("dbo.Polizas", "Amparos_ID_AMP");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Polizas", "Amparos_ID_AMP", c => c.Int());
            CreateIndex("dbo.Polizas", "Amparos_ID_AMP");
            AddForeignKey("dbo.Polizas", "Amparos_ID_AMP", "dbo.Amparos_Polizas", "ID_AMP");
        }
    }
}
