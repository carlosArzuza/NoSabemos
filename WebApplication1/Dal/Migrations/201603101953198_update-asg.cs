namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updateasg : DbMigration
    {
        public override void Up()
        {
            DropPrimaryKey("dbo.Aseguradoras");
            AlterColumn("dbo.Aseguradoras", "NIT_ASG", c => c.String(nullable: false, maxLength: 128));
            AlterColumn("dbo.Polizas", "ASEGURADORA", c => c.String());
            AddPrimaryKey("dbo.Aseguradoras", "NIT_ASG");
        }
        
        public override void Down()
        {
            DropPrimaryKey("dbo.Aseguradoras");
            AlterColumn("dbo.Polizas", "ASEGURADORA", c => c.Int(nullable: false));
            AlterColumn("dbo.Aseguradoras", "NIT_ASG", c => c.Int(nullable: false));
            AddPrimaryKey("dbo.Aseguradoras", "NIT_ASG");
        }
    }
}
