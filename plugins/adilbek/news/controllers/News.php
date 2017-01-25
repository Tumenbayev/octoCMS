<?php namespace Adilbek\News\Controllers;

use BackendMenu;
use Backend\Classes\Controller;

/**
 * News Back-end Controller
 */
class News extends Controller
{
    public $implement = [
        'Backend.Behaviors.FormController',
        'Backend.Behaviors.ListController'
    ];

    public $formConfig = 'config_form.yaml';
    public $listConfig = 'config_list.yaml';

    public function __construct()
    {
        parent::__construct();

        BackendMenu::setContext('Adilbek.News', 'news', 'news');
        $this->addJs("/themes/multi/assets/js/to_slug.js", "1.0.0");
    }
}
