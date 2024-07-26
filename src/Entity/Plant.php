<?php
namespace App\Entity;

use App\Repository\PlantRepository;
use Doctrine\ORM\Mapping as ORM;
use DateTime;

#[ORM\Entity(repositoryClass: PlantRepository::class)]
class Plant
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private ?int $id = null;

    #[ORM\Column(type: 'string', length: 255)]
    private ?string $name = null;

    #[ORM\Column(type: 'string', length: 255)]
    private ?string $latin_name = null;

    #[ORM\Column(type: 'string', length: 255)]
    private ?string $type = null;

    #[ORM\Column(type: 'text')]
    private ?string $description = null;

    #[ORM\Column(type: 'string', length: 50)]
    private ?string $size = null;

    #[ORM\Column(type: 'datetime', nullable: true)]
    private ?DateTime $floweringDate = null;

    #[ORM\Column(type: 'datetime')]
    private ?DateTime $createdDate = null;

    #[ORM\Column(type: 'datetime')]
    private ?DateTime $updatedDate = null;
    
    #[ORM\Column(type:"string", length: 255, nullable:true)]
    private ?string $image = null;

    #[ORM\Column(type: 'string', length: 255, nullable: true)]
    private ?string $slug = null;

    public function __construct()
    {
        $this->createdDate = new DateTime('now');
        $this->updatedDate = new DateTime('now');
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getLatinName(): ?string
    {
        return $this->latin_name;
    }

    public function setLatinName(string $latin_name): self
    {
        $this->latin_name = $latin_name;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getSize(): ?string
    {
        return $this->size;
    }

    public function setSize(string $size): self
    {
        $this->size = $size;

        return $this;
    }

    public function getFloweringDate(): ?DateTime
    {
        return $this->floweringDate;
    }

    public function setFloweringDate(?DateTime $floweringDate): self
    {
        $this->floweringDate = $floweringDate;

        return $this;
    }

    public function getCreatedDate(): ?DateTime
    {
        return $this->createdDate;
    }

    public function setCreatedDate(DateTime $createdDate): self
    {
        $this->createdDate = $createdDate;

        return $this;
    }

    public function getUpdatedDate(): ?DateTime
    {
        return $this->updatedDate;
    }

    public function setUpdatedDate(DateTime $updatedDate): self
    {
        $this->updatedDate = $updatedDate;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(?string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(?string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }
}
