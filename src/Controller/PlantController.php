<?php

namespace App\Controller;

use App\Entity\Plant;
use App\Form\PlantType;
use App\Repository\PlantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\String\Slugger\AsciiSlugger;


class PlantController extends AbstractController
{

    #[Route('/')] 
    public function redirection(): Response 
    {
        return $this->redirectToRoute('plant_list');
    }

    #[Route('/plants', name: 'plant_list')]
    public function list(Request $request, PlantRepository $plantRepository, PaginatorInterface $paginator): Response
    {
        $queryBuilder = $plantRepository->createQueryBuilder('p');
        
        
        $pagination = $paginator->paginate(
            $queryBuilder, 
            $request->query->getInt('page', 1), 
            10 
        );

        return $this->render('plant/list.html.twig', [
            'pagination' => $pagination,
        ]);
    }

    

    #[Route('/plant/{slug}-{id}', name: 'plant_detail', requirements: ['id' => '\d+', 'slug' => '[a-zA-Z0-9\-]+'])]
    public function detail(string $slug, int $id, PlantRepository $plantRepository): Response
    {
        $plant = $plantRepository->find($id);
    
        if (!$plant || $plant->getSlug() !== $slug) {
            throw $this->createNotFoundException('Plante non trouvée');
        }
    
        return $this->render('plant/detail.html.twig', [
            'plant' => $plant,
        ]);
    }

    
    #[Route('/plant/add', name: 'plant_add')]
    public function add(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $plant = new Plant();
        $form = $this->createForm(PlantType::class, $plant);

        $request->setLocale('fr');
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plant->setCreatedDate(new \DateTime('now'));
            $plant->setUpdatedDate(new \DateTime('now'));

            $uploadedFile = $form->get('image')->getData();
            if ($uploadedFile) {
                $originalFilename = pathinfo($uploadedFile->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$uploadedFile->guessExtension();

                $destination = $this->getParameter('kernel.project_dir').'/public/uploads/images';
                $uploadedFile->move($destination, $newFilename);

                $plant->setImage($newFilename);
            }

            $entityManager->persist($plant);
            $entityManager->flush();

            return $this->redirectToRoute('plant_list');
        }

        return $this->render('plant/add.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/plant/edit/{id}', name: 'plant_edit', requirements: ['id' => '\d+'])]
    public function edit(Request $request, Plant $plant, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(PlantType::class, $plant);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            

            $file = $form->get('image')->getData();
            if ($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $newFilename = $originalFilename.'-'.uniqid().'.'.$file->guessExtension();

                $file->move(
                    $this->getParameter('kernel.project_dir').'/public/uploads/images',
                    $newFilename
                );

                $plant->setImage($newFilename);
            }

            $plant->setUpdatedDate(new \DateTime('now'));

            $entityManager->flush();

            return $this->redirectToRoute('plant_list');
        }

        return $this->render('plant/edit.html.twig', [
            'form' => $form->createView(),
            'plant' => $plant,
        ]);
    }


    #[Route('/plant/delete/{id}', name: 'plant_delete', requirements: ['id' => '\d+'])]
    public function delete(Request $request, Plant $plant, EntityManagerInterface $entityManager): Response
    {
            $entityManager->remove($plant);
            $entityManager->flush();
        

        return $this->redirectToRoute('plant_list');
    }
}
