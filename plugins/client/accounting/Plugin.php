<?php namespace Client\Accounting;

use Backend;
use System\Classes\PluginBase;

/**
 * Accounting Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'Accounting',
            'description' => 'No description provided yet...',
            'author'      => 'Client',
            'icon'        => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {
        return []; // Remove this line to activate

        return [
            'Client\Accounting\Components\MyComponent' => 'myComponent',
        ];
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return []; // Remove this line to activate

        return [
            'client.accounting.some_permission' => [
                'tab' => 'Accounting',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {
        return [
            'accounting' => [
                'label'       => 'Учет клиентов',
                'url'         => Backend::url('client/accounting/accounting'),
                'icon'        => 'icon-money',
                'permissions' => ['client.accounting.*'],
                'order'       => 500,
            ],
        ];
    }
}
