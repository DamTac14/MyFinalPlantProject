<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240724135546 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE plant ADD flowering_date DATETIME DEFAULT NULL, ADD created_date DATETIME NOT NULL, ADD updated_date DATETIME NOT NULL, ADD image VARCHAR(255) DEFAULT NULL, ADD slug VARCHAR(255) DEFAULT NULL');
        $this->addSql('DROP INDEX UNIQ_8D93D6495126AC48 ON user');
        $this->addSql('ALTER TABLE user ADD roles JSON NOT NULL, DROP name, DROP firstname, CHANGE mail email VARCHAR(180) NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_IDENTIFIER_EMAIL ON user (email)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE plant DROP flowering_date, DROP created_date, DROP updated_date, DROP image, DROP slug');
        $this->addSql('DROP INDEX UNIQ_IDENTIFIER_EMAIL ON user');
        $this->addSql('ALTER TABLE user ADD name VARCHAR(255) NOT NULL, ADD firstname VARCHAR(255) NOT NULL, DROP roles, CHANGE email mail VARCHAR(180) NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_8D93D6495126AC48 ON user (mail)');
    }
}
