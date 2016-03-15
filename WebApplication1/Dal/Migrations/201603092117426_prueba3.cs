namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class prueba3 : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Aspirantes", "NIT_CEDULA");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Aspirantes", "NIT_CEDULA", c => c.String());
        }
    }
}
