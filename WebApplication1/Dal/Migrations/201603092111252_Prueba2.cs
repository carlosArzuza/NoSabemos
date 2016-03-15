namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Prueba2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Aspirantes", "NIT", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Aspirantes", "NIT");
        }
    }
}
