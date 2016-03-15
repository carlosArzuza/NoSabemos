namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class nuevos_a : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Polizas", "OFERTAMERCANTIL", c => c.String());
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Polizas", "OFERTAMERCANTIL", c => c.Int(nullable: false));
        }
    }
}
