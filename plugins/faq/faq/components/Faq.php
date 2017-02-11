<?php namespace Faq\Faq\Components;

use Cms\Classes\ComponentBase;
use Faq\Faq\Models\Faq as FaqModel;

class Faq extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'faq Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function getFaqs()
    {
        return FaqModel::orderBy('id', 'desc')->paginate(10);
    }

    public function defineProperties()
    {
        return [];
    }
}
