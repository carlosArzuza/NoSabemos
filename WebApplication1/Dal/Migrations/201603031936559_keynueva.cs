namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class keynueva : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.Oferta_Mercantil");
            AlterColumn("dbo.Oferta_Mercantil", "N_OFM", c => c.String(nullable: false, maxLength: 128));
            AddPrimaryKey("dbo.Oferta_Mercantil", "N_OFM");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.Oferta_Mercantil");
            AlterColumn("dbo.Oferta_Mercantil", "N_OFM", c => c.String());
            AddPrimaryKey("dbo.Oferta_Mercantil", "ID_OFERTA");
        }
    }
}
