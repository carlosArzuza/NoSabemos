namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addcuidad : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Aspirantes", "CIUDAD", c => c.String());
            DropColumn("dbo.Aspirantes", "CUIDAD");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Aspirantes", "CUIDAD", c => c.String());
            DropColumn("dbo.Aspirantes", "CIUDAD");
        }
    }
}
