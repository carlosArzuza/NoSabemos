namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class contactos : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Aspirantes", "CONTACTO_1", c => c.String());
            AddColumn("dbo.Aspirantes", "CONTACTO_2", c => c.String());
            AddColumn("dbo.Aspirantes", "CONTACTO_3", c => c.String());
            AddColumn("dbo.Aspirantes", "CONTACTO_4", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Aspirantes", "CONTACTO_4");
            DropColumn("dbo.Aspirantes", "CONTACTO_3");
            DropColumn("dbo.Aspirantes", "CONTACTO_2");
            DropColumn("dbo.Aspirantes", "CONTACTO_1");
        }
    }
}
