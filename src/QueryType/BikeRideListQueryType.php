<?php

namespace App\QueryType;


use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\API\Repository\Values\Content\Query\Criterion;
use eZ\Publish\Core\QueryType\QueryType;

class BikeRideListQueryType implements QueryType
{
    /**
     * @return string
     */
    public static function getName()
    {
        return 'BikeRideList';
    }

    /**
     * @param array $parameters
     * @return Query
     */
    public function getQuery(array $parameters = [])
    {
        $criteria =  [
            new Criterion\Visibility(Criterion\Visibility::VISIBLE),
            new Criterion\ContentTypeIdentifier('bike_ride'),
        ];

        if (!empty($parameters['search_text'])){
            $criteria[] = new Criterion\FullText($parameters['search_text']);
        }
        return new Query([
            'filter' => new Criterion\LogicalAnd($criteria)
        ]);
    }

    /**
     * @return array|void
     */
    public function getSupportedParameters()
    {
        return ['search_text'];
    }
}