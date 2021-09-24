<?php

namespace App\Controller;

use eZ\Publish\API\Repository\ContentService;
use eZ\Publish\API\Repository\Values\Content\Relation;
use eZ\Publish\Core\MVC\Symfony\View\ContentView;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use eZ\Publish\API\Repository\Repository;
class PointOfInterestController extends AbstractController
{
    /** @var ContentService */
    private $contentService;

    private $repository;

    public function __construct(Repository $repository)
    {
        $this->repository = $repository;
        $this->contentService = $this->repository->getContentService();
    }

    /**
     * Add 'bike_ride' reverse relations to default view as a `rides` variable accessible from template.
     */
    public function pointOfInterestView(ContentView $view): ContentView
    {
        $content = $view->getContent();
       // $reverseRelations = $this->contentService->loadReverseRelations($content->contentInfo);
        $reverseRelations = $this->repository->sudo(function (Repository $repository) use ($content) {
            return $repository->getContentService()->loadReverseRelations($content->contentInfo);
        });
        $ridesContentInfo = [];
        foreach ($reverseRelations as $reverseRelation){
            $sourceContentInfo = $reverseRelation->getSourceContentInfo();
            if('bike_ride' == $sourceContentInfo->getContentType()->identifier && $this->repository->getPermissionResolver()->canUser('content','read',$sourceContentInfo)){
                $ridesContentInfo[] = $sourceContentInfo;
            }
        }
        $rides = $this->contentService->loadContentListByContentInfo($ridesContentInfo);

        $view->addParameters(['rides'=>$rides]);
        return $view;
    }
}
