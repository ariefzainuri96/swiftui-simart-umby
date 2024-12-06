//
//  EditDataBarangAsetVM.swift
//  Simart UMBY
//
//  Created by фкшуа on 07/12/24.
//

import Perception

@Perceptible class EditDataBarangAsetVM {
    let repo = DataBarangAsetRepositoryImpl()
    
    var state = RequestState.IDLE
    var detailData = DetailDataBarangAsetModel()
    
    var vendor: [String] = []
    var vendorPage = 1
    var vendorMaxPage = 3
    var vendorState = RequestState.IDLE
    
    func getDetailData(data: DataBarangAsetModel) async {
        state = RequestState.LOADING
        
        let data = await repo.getDetailBarangAset()
        
        state = data != nil ? RequestState.SUCCESS : RequestState.ERROR
        
        detailData = data ?? DetailDataBarangAsetModel()
    }
    
    func getVendor(isInitial: Bool = true) async {
        if (vendorState == RequestState.LOADING || vendorState == RequestState.LOADING_NEXT_PAGE || vendorState == RequestState.MAX_PAGE) {return}
        
        if (isInitial) {
            vendorPage = 1
            vendor.removeAll()
            vendorState = RequestState.IDLE
        }
        
        vendorState = isInitial ? RequestState.LOADING : RequestState.LOADING_NEXT_PAGE
        
        let data = await repo.getVendor()
        
        vendorState = data != nil ? RequestState.SUCCESS : (isInitial ? RequestState.ERROR : RequestState.ERROR_NEXT_PAGE)
        
        guard let _data = data else { return }
        
        print("getVendor page -> \(vendorPage)")
        
        if (vendorPage == vendorMaxPage) {
            vendorState = RequestState.MAX_PAGE
        }
        
        vendorPage += 1
        vendor.append(contentsOf: _data)
    }
}
