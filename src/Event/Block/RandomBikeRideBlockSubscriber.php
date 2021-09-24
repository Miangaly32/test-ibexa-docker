<?php

namespace App\Event\Block;

use eZ\Publish\API\Repository\SearchService;
use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\API\Repository\Values\Content\Query\Criterion;
use EzSystems\EzPlatformPageFieldType\FieldType\Page\Block\Renderer\BlockRenderEvents;
use EzSystems\EzPlatformPageFieldType\FieldType\Page\Block\Renderer\Event\PreRenderEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use eZ\Publish\API\Repository\Values\Content\Query\SortClause;
use EzSystems\EzPlatformRichText\eZ\RichText\DOMDocumentFactory;

class RandomBikeRideBlockSubscriber implements EventSubscriberInterface
{
    private $searchService;
    private $domDocumentFactory;

    public function __construct(SearchService $searchService,DOMDocumentFactory $domDocumentFactory){
        $this->domDocumentFactory = $domDocumentFactory;
        $this->searchService = $searchService;
    }
    public static function getSubscribedEvents()
    {
        return [
            BlockRenderEvents::getBlockPreRenderEventName('random_block') => 'onBlockPreRender'
        ];
    }

    public function onBlockPreRender(PreRenderEvent $event)
    {
        $renderRequest = $event->getRenderRequest();

        $parameters = $event->getRenderRequest()->getParameters();

        $contentType = $event->getBlockValue()->getAttribute('contentType')->getValue();
        
        $criteria =  [
            new Criterion\Visibility(Criterion\Visibility::VISIBLE),
            new Criterion\ContentTypeIdentifier($contentType),
        ];

        $query = new Query([
            'filter' => new Criterion\LogicalAnd($criteria),
            'sortClauses' =>  [new SortClause\Random()],
            'limit' => 1
        ]);

        $result = $this->searchService->findContent($query);

        $parameters['document'] = null;
        $xml = $event->getBlockValue()->getAttribute('description')->getValue();
        if (!empty($xml)) {
            $parameters['document'] = $this->domDocumentFactory->loadXMLString($xml);
        }

        $parameters['content'] = $result->totalCount ? $result->searchHits[0]->valueObject : null;

        $renderRequest->setParameters($parameters);
    }
}