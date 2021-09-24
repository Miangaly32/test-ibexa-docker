<?php

namespace App\Controller;

use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\Core\Pagination\Pagerfanta\ContentSearchAdapter;
use eZ\Publish\Core\QueryType\QueryTypeRegistry;
use Pagerfanta\Pagerfanta;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;

class SearchController extends AbstractController
{
    private $searchService;
    private $queryTypeRegistry;

    public function __construct(SearchService $searchService, QueryTypeRegistry $queryTypeRegistry)
    {
        $this->searchService = $searchService;
        $this->queryTypeRegistry= $queryTypeRegistry;
    }

    public function bikeRideSearch(Request $request) {
        $q = $request->get('q');

        $queryType = $this->queryTypeRegistry->getQueryType('BikeRideList');

        $query = $queryType->getQuery(['search_text'=>$q]);

        $pager = new Pagerfanta(
            new ContentSearchAdapter($query, $this->searchService)
        );
        $pager->setMaxPerPage(3);
        $pager->setCurrentPage($request->get('page', 1));

        return $this->render('@ezdesign/search_pagination.html.twig', [
                'bike_rides' => $pager,
                'search_text' => $q
            ]
        );

//        return $this->render('@ezdesign/search.html.twig',[
//            'bike_rides' => $this->searchService->findContent($query),
//            'search_text' => $q
//        ]);
    }
}