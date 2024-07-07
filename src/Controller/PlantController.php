<?php

namespace App\Controller;

use App\Entity\Plant;
use App\Repository\PlantRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PlantController extends AbstractController
{
    #[Route('/plants', name: 'plant_list')]
    public function list(PlantRepository $plantRepository): Response
    {
        $plants = $plantRepository->findAll();
        return $this->render('plant/list.html.twig', [
            'plants' => $plants,
        ]);
    }

    #[Route('/plant/{id}', name: 'plant_detail', requirements: ['id' => '\d+'])]
    public function detail(Plant $plant): Response
    {
        return $this->render('plant/detail.html.twig', [
            'plant' => $plant,
        ]);
    }

    #[Route('/plant/add', name: 'plant_add')]
    public function add(Request $request, EntityManagerInterface $entityManager): Response
    {
        $plant = new Plant();
        $form = $this->createFormBuilder($plant)
            ->add('name')
            ->add('latin_name')
            ->add('type')
            ->add('description')
            ->add('size')
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
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
        $form = $this->createFormBuilder($plant)
            ->add('name')
            ->add('latin_name')
            ->add('type')
            ->add('description')
            ->add('size')
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->flush();

            return $this->redirectToRoute('plant_list');
        }

        return $this->render('plant/edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/plant/delete/{id}', name: 'plant_delete', requirements: ['id' => '\d+'])]
    public function delete(Request $request, Plant $plant, EntityManagerInterface $entityManager): Response
    {
        if ($this->isCsrfTokenValid('delete'.$plant->getId(), $request->request->get('_token'))) {
            $entityManager->remove($plant);
            $entityManager->flush();
        }

        return $this->redirectToRoute('plant_list');
    }
}
