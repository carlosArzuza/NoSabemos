namespace Dal.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Aseg : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Aseguradoras",
                c => new
                    {
                        NIT_ASG = c.Int(nullable: false),
                        ID_ASG = c.Int(nullable: false, identity: true),
                        NOMBRE_ASG = c.String(),
                        ESTADO_ASG = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.NIT_ASG);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Aseguradoras");
        }
    }
}
