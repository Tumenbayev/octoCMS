<?php namespace Client\Client;

use Backend;
use System\Classes\PluginBase;

/**
 * Client Plugin Information File
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
            'name'        => 'Client',
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
            'Client\Client\Components\MyComponent' => 'myComponent',
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
            'client.client.some_permission' => [
                'tab' => 'Client',
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
            'client' => [
                'label'       => 'Клиенты',
                'url'         => Backend::url('client/client/client'),
                'icon'        => 'icon-user',
                'permissions' => ['client.client.*'],
                'order'       => 500,
            ],
        ];
    }
}
