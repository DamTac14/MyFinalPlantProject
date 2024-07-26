<?php
namespace App\Form;

use App\Entity\Plant;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;

class PlantType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Nom de la plante'
            ])
            ->add('latin_name', TextType::class, [
                'label' => 'Nom latin'
            ])
            ->add('type', TextType::class, [
                'label' => 'Type'
            ])
            ->add('description', TextareaType::class, [
                'label' => 'Description'
            ])
            ->add('size', TextType::class, [
                'label' => 'Taille'
            ])
            ->add('floweringDate', DateTimeType::class, [
                'label' => 'Date de floraison',
                'widget' => 'single_text',
                'required' => false
            ])
            ->add('image', FileType::class, [
                'label' => 'Image',
                'required' => false,
                'mapped' => false,
                'attr' => ['accept' => 'image/*']
            ])
            // ->add('save', SubmitType::class, [
            //     'label' => 'Ajouter'
            // ])
            ->addEventListener(FormEvents::POST_SUBMIT, [$this, 'onPostSubmit']);
    }


    public function onPostSubmit(FormEvent $event)
    {
        $plant = $event->getData();
        
        if (!$plant instanceof Plant) {
            return;
        }
        
        $slugger = new AsciiSlugger();
        $name = $plant->getName();
        if ($name) {
            $slug = $slugger->slug($name);
            $plant->setSlug($slug);
        }
        
        if ($plant->getCreatedDate() === null) {
            $plant->setCreatedDate(new \DateTime('now'));
        }
        
        $plant->setUpdatedDate(new \DateTime('now'));
    }

    
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Plant::class,
        ]);
    }
}
