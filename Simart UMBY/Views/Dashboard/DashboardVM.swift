//
//  DashboardVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 22/11/24.
//

import Perception

@Perceptible class DashboardVM {
    let menuList: [MenuModel] = [
        MenuModel(id: 0, image: "ic-manajamen-inventaris", title: "Manajemen Inventaris", bgColor: "#438AF7", onClick: {}),
        MenuModel(id: 1, image: "ic-manajemen-barang-pakai-habis", title: "Manajemen Barang Pakai Habis", bgColor: "#5856D6", onClick: {}),
        MenuModel(id: 2, image: "ic-manajemen-aset", title: "Manajemen Aset", bgColor: "#06B6D4", onClick: {}),
        MenuModel(id: 3, image: "ic-task-approval", title: "Task Approval", bgColor: "#1FA836", onClick: {}),
    ]
}
