import Foundation
import Tea
import TeaUtils
import AlibabacloudOpenApi
import AlibabaCloudOpenApiUtil
import AlibabacloudEndpointUtil

open class Client : AlibabacloudOpenApi.Client {
    public override init(_ config: AlibabacloudOpenApi.Config) throws {
        try super.init(config)
        self._endpointRule = "central"
        try checkConfig(config as! AlibabacloudOpenApi.Config)
        self._endpoint = try getEndpoint("cbn", self._regionId ?? "", self._endpointRule ?? "", self._network ?? "", self._suffix ?? "", self._endpointMap ?? [:], self._endpoint ?? "")
    }

    public func getEndpoint(_ productId: String, _ regionId: String, _ endpointRule: String, _ network: String, _ suffix: String, _ endpointMap: [String: String], _ endpoint: String) throws -> String {
        if (!TeaUtils.Client.empty(endpoint)) {
            return endpoint as! String
        }
        if (!TeaUtils.Client.isUnset(endpointMap) && !TeaUtils.Client.empty(endpointMap[regionId as! String])) {
            return endpointMap[regionId as! String] ?? ""
        }
        return try AlibabacloudEndpointUtil.Client.getEndpointRules(productId, regionId, endpointRule, network, suffix)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func activeFlowLogWithOptions(_ request: ActiveFlowLogRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ActiveFlowLogResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogId)) {
            query["FlowLogId"] = request.flowLogId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ActiveFlowLog",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ActiveFlowLogResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func activeFlowLog(_ request: ActiveFlowLogRequest) async throws -> ActiveFlowLogResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await activeFlowLogWithOptions(request as! ActiveFlowLogRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addTrafficMatchRuleToTrafficMarkingPolicyWithOptions(_ request: AddTrafficMatchRuleToTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AddTrafficMatchRuleToTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMatchRules)) {
            query["TrafficMatchRules"] = request.trafficMatchRules ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AddTrafficMatchRuleToTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AddTrafficMatchRuleToTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addTrafficMatchRuleToTrafficMarkingPolicy(_ request: AddTrafficMatchRuleToTrafficMarkingPolicyRequest) async throws -> AddTrafficMatchRuleToTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await addTrafficMatchRuleToTrafficMarkingPolicyWithOptions(request as! AddTrafficMatchRuleToTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addTraficMatchRuleToTrafficMarkingPolicyWithOptions(_ request: AddTraficMatchRuleToTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AddTraficMatchRuleToTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMatchRules)) {
            query["TrafficMatchRules"] = request.trafficMatchRules ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AddTraficMatchRuleToTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AddTraficMatchRuleToTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func addTraficMatchRuleToTrafficMarkingPolicy(_ request: AddTraficMatchRuleToTrafficMarkingPolicyRequest) async throws -> AddTraficMatchRuleToTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await addTraficMatchRuleToTrafficMarkingPolicyWithOptions(request as! AddTraficMatchRuleToTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateCenBandwidthPackageWithOptions(_ request: AssociateCenBandwidthPackageRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AssociateCenBandwidthPackageResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AssociateCenBandwidthPackage",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AssociateCenBandwidthPackageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateCenBandwidthPackage(_ request: AssociateCenBandwidthPackageRequest) async throws -> AssociateCenBandwidthPackageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await associateCenBandwidthPackageWithOptions(request as! AssociateCenBandwidthPackageRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateTransitRouterAttachmentWithRouteTableWithOptions(_ request: AssociateTransitRouterAttachmentWithRouteTableRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AssociateTransitRouterAttachmentWithRouteTableResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AssociateTransitRouterAttachmentWithRouteTable",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AssociateTransitRouterAttachmentWithRouteTableResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateTransitRouterAttachmentWithRouteTable(_ request: AssociateTransitRouterAttachmentWithRouteTableRequest) async throws -> AssociateTransitRouterAttachmentWithRouteTableResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await associateTransitRouterAttachmentWithRouteTableWithOptions(request as! AssociateTransitRouterAttachmentWithRouteTableRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateTransitRouterMulticastDomainWithOptions(_ request: AssociateTransitRouterMulticastDomainRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AssociateTransitRouterMulticastDomainResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchIds)) {
            query["VSwitchIds"] = request.vSwitchIds ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AssociateTransitRouterMulticastDomain",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AssociateTransitRouterMulticastDomainResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func associateTransitRouterMulticastDomain(_ request: AssociateTransitRouterMulticastDomainRequest) async throws -> AssociateTransitRouterMulticastDomainResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await associateTransitRouterMulticastDomainWithOptions(request as! AssociateTransitRouterMulticastDomainRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func attachCenChildInstanceWithOptions(_ request: AttachCenChildInstanceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> AttachCenChildInstanceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceOwnerId)) {
            query["ChildInstanceOwnerId"] = request.childInstanceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "AttachCenChildInstance",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(AttachCenChildInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func attachCenChildInstance(_ request: AttachCenChildInstanceRequest) async throws -> AttachCenChildInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await attachCenChildInstanceWithOptions(request as! AttachCenChildInstanceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func checkTransitRouterServiceWithOptions(_ request: CheckTransitRouterServiceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CheckTransitRouterServiceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CheckTransitRouterService",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CheckTransitRouterServiceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func checkTransitRouterService(_ request: CheckTransitRouterServiceRequest) async throws -> CheckTransitRouterServiceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await checkTransitRouterServiceWithOptions(request as! CheckTransitRouterServiceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenWithOptions(_ request: CreateCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.protectionLevel)) {
            query["ProtectionLevel"] = request.protectionLevel ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCen(_ request: CreateCenRequest) async throws -> CreateCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenWithOptions(request as! CreateCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenBandwidthPackageWithOptions(_ request: CreateCenBandwidthPackageRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenBandwidthPackageResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPay)) {
            query["AutoPay"] = request.autoPay!;
        }
        if (!TeaUtils.Client.isUnset(request.autoRenew)) {
            query["AutoRenew"] = request.autoRenew!;
        }
        if (!TeaUtils.Client.isUnset(request.autoRenewDuration)) {
            query["AutoRenewDuration"] = request.autoRenewDuration!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidth)) {
            query["Bandwidth"] = request.bandwidth!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidthPackageChargeType)) {
            query["BandwidthPackageChargeType"] = request.bandwidthPackageChargeType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.geographicRegionAId)) {
            query["GeographicRegionAId"] = request.geographicRegionAId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.geographicRegionBId)) {
            query["GeographicRegionBId"] = request.geographicRegionBId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.period)) {
            query["Period"] = request.period!;
        }
        if (!TeaUtils.Client.isUnset(request.pricingCycle)) {
            query["PricingCycle"] = request.pricingCycle ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenBandwidthPackage",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenBandwidthPackageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenBandwidthPackage(_ request: CreateCenBandwidthPackageRequest) async throws -> CreateCenBandwidthPackageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenBandwidthPackageWithOptions(request as! CreateCenBandwidthPackageRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenChildInstanceRouteEntryToAttachmentWithOptions(_ request: CreateCenChildInstanceRouteEntryToAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenChildInstanceRouteEntryToAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeTableId)) {
            query["RouteTableId"] = request.routeTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenChildInstanceRouteEntryToAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenChildInstanceRouteEntryToAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenChildInstanceRouteEntryToAttachment(_ request: CreateCenChildInstanceRouteEntryToAttachmentRequest) async throws -> CreateCenChildInstanceRouteEntryToAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenChildInstanceRouteEntryToAttachmentWithOptions(request as! CreateCenChildInstanceRouteEntryToAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenChildInstanceRouteEntryToCenWithOptions(_ request: CreateCenChildInstanceRouteEntryToCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenChildInstanceRouteEntryToCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceAliUid)) {
            query["ChildInstanceAliUid"] = request.childInstanceAliUid!;
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeTableId)) {
            query["RouteTableId"] = request.routeTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenChildInstanceRouteEntryToCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenChildInstanceRouteEntryToCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenChildInstanceRouteEntryToCen(_ request: CreateCenChildInstanceRouteEntryToCenRequest) async throws -> CreateCenChildInstanceRouteEntryToCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenChildInstanceRouteEntryToCenWithOptions(request as! CreateCenChildInstanceRouteEntryToCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenInterRegionTrafficQosPolicyWithOptions(_ request: CreateCenInterRegionTrafficQosPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenInterRegionTrafficQosPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyDescription)) {
            query["TrafficQosPolicyDescription"] = request.trafficQosPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyName)) {
            query["TrafficQosPolicyName"] = request.trafficQosPolicyName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosQueues)) {
            query["TrafficQosQueues"] = request.trafficQosQueues ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenInterRegionTrafficQosPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenInterRegionTrafficQosPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenInterRegionTrafficQosPolicy(_ request: CreateCenInterRegionTrafficQosPolicyRequest) async throws -> CreateCenInterRegionTrafficQosPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenInterRegionTrafficQosPolicyWithOptions(request as! CreateCenInterRegionTrafficQosPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenInterRegionTrafficQosQueueWithOptions(_ request: CreateCenInterRegionTrafficQosQueueRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenInterRegionTrafficQosQueueResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.dscps)) {
            query["Dscps"] = request.dscps ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueDescription)) {
            query["QosQueueDescription"] = request.qosQueueDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueName)) {
            query["QosQueueName"] = request.qosQueueName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.remainBandwidthPercent)) {
            query["RemainBandwidthPercent"] = request.remainBandwidthPercent ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyId)) {
            query["TrafficQosPolicyId"] = request.trafficQosPolicyId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenInterRegionTrafficQosQueue",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenInterRegionTrafficQosQueueResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenInterRegionTrafficQosQueue(_ request: CreateCenInterRegionTrafficQosQueueRequest) async throws -> CreateCenInterRegionTrafficQosQueueResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenInterRegionTrafficQosQueueWithOptions(request as! CreateCenInterRegionTrafficQosQueueRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenRouteMapWithOptions(_ request: CreateCenRouteMapRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateCenRouteMapResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.asPathMatchMode)) {
            query["AsPathMatchMode"] = request.asPathMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenRegionId)) {
            query["CenRegionId"] = request.cenRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cidrMatchMode)) {
            query["CidrMatchMode"] = request.cidrMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.communityMatchMode)) {
            query["CommunityMatchMode"] = request.communityMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.communityOperateMode)) {
            query["CommunityOperateMode"] = request.communityOperateMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationChildInstanceTypes)) {
            query["DestinationChildInstanceTypes"] = request.destinationChildInstanceTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlocks)) {
            query["DestinationCidrBlocks"] = request.destinationCidrBlocks ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationInstanceIds)) {
            query["DestinationInstanceIds"] = request.destinationInstanceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationInstanceIdsReverseMatch)) {
            query["DestinationInstanceIdsReverseMatch"] = request.destinationInstanceIdsReverseMatch!;
        }
        if (!TeaUtils.Client.isUnset(request.destinationRouteTableIds)) {
            query["DestinationRouteTableIds"] = request.destinationRouteTableIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.mapResult)) {
            query["MapResult"] = request.mapResult ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.matchAddressType)) {
            query["MatchAddressType"] = request.matchAddressType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.matchAsns)) {
            query["MatchAsns"] = request.matchAsns ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.matchCommunitySet)) {
            query["MatchCommunitySet"] = request.matchCommunitySet ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.nextPriority)) {
            query["NextPriority"] = request.nextPriority!;
        }
        if (!TeaUtils.Client.isUnset(request.operateCommunitySet)) {
            query["OperateCommunitySet"] = request.operateCommunitySet ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.preference)) {
            query["Preference"] = request.preference!;
        }
        if (!TeaUtils.Client.isUnset(request.prependAsPath)) {
            query["PrependAsPath"] = request.prependAsPath ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.priority)) {
            query["Priority"] = request.priority!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeTypes)) {
            query["RouteTypes"] = request.routeTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceChildInstanceTypes)) {
            query["SourceChildInstanceTypes"] = request.sourceChildInstanceTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceInstanceIds)) {
            query["SourceInstanceIds"] = request.sourceInstanceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceInstanceIdsReverseMatch)) {
            query["SourceInstanceIdsReverseMatch"] = request.sourceInstanceIdsReverseMatch!;
        }
        if (!TeaUtils.Client.isUnset(request.sourceRegionIds)) {
            query["SourceRegionIds"] = request.sourceRegionIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceRouteTableIds)) {
            query["SourceRouteTableIds"] = request.sourceRouteTableIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transmitDirection)) {
            query["TransmitDirection"] = request.transmitDirection ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateCenRouteMap",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateCenRouteMapResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createCenRouteMap(_ request: CreateCenRouteMapRequest) async throws -> CreateCenRouteMapResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createCenRouteMapWithOptions(request as! CreateCenRouteMapRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createFlowlogWithOptions(_ request: CreateFlowlogRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateFlowlogResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogName)) {
            query["FlowLogName"] = request.flowLogName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.interval)) {
            query["Interval"] = request.interval!;
        }
        if (!TeaUtils.Client.isUnset(request.logStoreName)) {
            query["LogStoreName"] = request.logStoreName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.projectName)) {
            query["ProjectName"] = request.projectName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateFlowlog",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateFlowlogResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createFlowlog(_ request: CreateFlowlogRequest) async throws -> CreateFlowlogResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createFlowlogWithOptions(request as! CreateFlowlogRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTrafficMarkingPolicyWithOptions(_ request: CreateTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.markingDscp)) {
            query["MarkingDscp"] = request.markingDscp!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.priority)) {
            query["Priority"] = request.priority!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyDescription)) {
            query["TrafficMarkingPolicyDescription"] = request.trafficMarkingPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyName)) {
            query["TrafficMarkingPolicyName"] = request.trafficMarkingPolicyName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMatchRules)) {
            query["TrafficMatchRules"] = request.trafficMatchRules ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTrafficMarkingPolicy(_ request: CreateTrafficMarkingPolicyRequest) async throws -> CreateTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTrafficMarkingPolicyWithOptions(request as! CreateTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterWithOptions(_ request: CreateTransitRouterRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.supportMulticast)) {
            query["SupportMulticast"] = request.supportMulticast!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterDescription)) {
            query["TransitRouterDescription"] = request.transitRouterDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterName)) {
            query["TransitRouterName"] = request.transitRouterName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouter",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouter(_ request: CreateTransitRouterRequest) async throws -> CreateTransitRouterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterWithOptions(request as! CreateTransitRouterRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterMulticastDomainWithOptions(_ request: CreateTransitRouterMulticastDomainRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterMulticastDomainResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainDescription)) {
            query["TransitRouterMulticastDomainDescription"] = request.transitRouterMulticastDomainDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainName)) {
            query["TransitRouterMulticastDomainName"] = request.transitRouterMulticastDomainName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterMulticastDomain",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterMulticastDomainResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterMulticastDomain(_ request: CreateTransitRouterMulticastDomainRequest) async throws -> CreateTransitRouterMulticastDomainResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterMulticastDomainWithOptions(request as! CreateTransitRouterMulticastDomainRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterPeerAttachmentWithOptions(_ request: CreateTransitRouterPeerAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterPeerAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidth)) {
            query["Bandwidth"] = request.bandwidth!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidthType)) {
            query["BandwidthType"] = request.bandwidthType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.peerTransitRouterId)) {
            query["PeerTransitRouterId"] = request.peerTransitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.peerTransitRouterRegionId)) {
            query["PeerTransitRouterRegionId"] = request.peerTransitRouterRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterPeerAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterPeerAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterPeerAttachment(_ request: CreateTransitRouterPeerAttachmentRequest) async throws -> CreateTransitRouterPeerAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterPeerAttachmentWithOptions(request as! CreateTransitRouterPeerAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterPrefixListAssociationWithOptions(_ request: CreateTransitRouterPrefixListAssociationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterPrefixListAssociationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.nextHop)) {
            query["NextHop"] = request.nextHop ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.nextHopType)) {
            query["NextHopType"] = request.nextHopType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerUid)) {
            query["OwnerUid"] = request.ownerUid!;
        }
        if (!TeaUtils.Client.isUnset(request.prefixListId)) {
            query["PrefixListId"] = request.prefixListId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterTableId)) {
            query["TransitRouterTableId"] = request.transitRouterTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterPrefixListAssociation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterPrefixListAssociationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterPrefixListAssociation(_ request: CreateTransitRouterPrefixListAssociationRequest) async throws -> CreateTransitRouterPrefixListAssociationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterPrefixListAssociationWithOptions(request as! CreateTransitRouterPrefixListAssociationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterRouteEntryWithOptions(_ request: CreateTransitRouterRouteEntryRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterRouteEntryResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryDescription)) {
            query["TransitRouterRouteEntryDescription"] = request.transitRouterRouteEntryDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryDestinationCidrBlock)) {
            query["TransitRouterRouteEntryDestinationCidrBlock"] = request.transitRouterRouteEntryDestinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryName)) {
            query["TransitRouterRouteEntryName"] = request.transitRouterRouteEntryName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryNextHopId)) {
            query["TransitRouterRouteEntryNextHopId"] = request.transitRouterRouteEntryNextHopId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryNextHopType)) {
            query["TransitRouterRouteEntryNextHopType"] = request.transitRouterRouteEntryNextHopType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterRouteEntry",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterRouteEntryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterRouteEntry(_ request: CreateTransitRouterRouteEntryRequest) async throws -> CreateTransitRouterRouteEntryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterRouteEntryWithOptions(request as! CreateTransitRouterRouteEntryRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterRouteTableWithOptions(_ request: CreateTransitRouterRouteTableRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterRouteTableResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableDescription)) {
            query["TransitRouterRouteTableDescription"] = request.transitRouterRouteTableDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableName)) {
            query["TransitRouterRouteTableName"] = request.transitRouterRouteTableName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterRouteTable",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterRouteTableResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterRouteTable(_ request: CreateTransitRouterRouteTableRequest) async throws -> CreateTransitRouterRouteTableResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterRouteTableWithOptions(request as! CreateTransitRouterRouteTableRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVbrAttachmentWithOptions(_ request: CreateTransitRouterVbrAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterVbrAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vbrId)) {
            query["VbrId"] = request.vbrId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vbrOwnerId)) {
            query["VbrOwnerId"] = request.vbrOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterVbrAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterVbrAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVbrAttachment(_ request: CreateTransitRouterVbrAttachmentRequest) async throws -> CreateTransitRouterVbrAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterVbrAttachmentWithOptions(request as! CreateTransitRouterVbrAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVpcAttachmentWithOptions(_ request: CreateTransitRouterVpcAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterVpcAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.chargeType)) {
            query["ChargeType"] = request.chargeType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpcOwnerId)) {
            query["VpcOwnerId"] = request.vpcOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.zoneMappings)) {
            query["ZoneMappings"] = request.zoneMappings ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterVpcAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterVpcAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVpcAttachment(_ request: CreateTransitRouterVpcAttachmentRequest) async throws -> CreateTransitRouterVpcAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterVpcAttachmentWithOptions(request as! CreateTransitRouterVpcAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVpnAttachmentWithOptions(_ request: CreateTransitRouterVpnAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> CreateTransitRouterVpnAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.chargeType)) {
            query["ChargeType"] = request.chargeType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpnId)) {
            query["VpnId"] = request.vpnId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpnOwnerId)) {
            query["VpnOwnerId"] = request.vpnOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.zone)) {
            query["Zone"] = request.zone ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "CreateTransitRouterVpnAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(CreateTransitRouterVpnAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func createTransitRouterVpnAttachment(_ request: CreateTransitRouterVpnAttachmentRequest) async throws -> CreateTransitRouterVpnAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await createTransitRouterVpnAttachmentWithOptions(request as! CreateTransitRouterVpnAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deactiveFlowLogWithOptions(_ request: DeactiveFlowLogRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeactiveFlowLogResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogId)) {
            query["FlowLogId"] = request.flowLogId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeactiveFlowLog",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeactiveFlowLogResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deactiveFlowLog(_ request: DeactiveFlowLogRequest) async throws -> DeactiveFlowLogResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deactiveFlowLogWithOptions(request as! DeactiveFlowLogRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenWithOptions(_ request: DeleteCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCen(_ request: DeleteCenRequest) async throws -> DeleteCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenWithOptions(request as! DeleteCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenBandwidthPackageWithOptions(_ request: DeleteCenBandwidthPackageRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenBandwidthPackageResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenBandwidthPackage",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenBandwidthPackageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenBandwidthPackage(_ request: DeleteCenBandwidthPackageRequest) async throws -> DeleteCenBandwidthPackageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenBandwidthPackageWithOptions(request as! DeleteCenBandwidthPackageRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenChildInstanceRouteEntryToAttachmentWithOptions(_ request: DeleteCenChildInstanceRouteEntryToAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenChildInstanceRouteEntryToAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeTableId)) {
            query["RouteTableId"] = request.routeTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenChildInstanceRouteEntryToAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenChildInstanceRouteEntryToAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenChildInstanceRouteEntryToAttachment(_ request: DeleteCenChildInstanceRouteEntryToAttachmentRequest) async throws -> DeleteCenChildInstanceRouteEntryToAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenChildInstanceRouteEntryToAttachmentWithOptions(request as! DeleteCenChildInstanceRouteEntryToAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenChildInstanceRouteEntryToCenWithOptions(_ request: DeleteCenChildInstanceRouteEntryToCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenChildInstanceRouteEntryToCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceAliUid)) {
            query["ChildInstanceAliUid"] = request.childInstanceAliUid!;
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeTableId)) {
            query["RouteTableId"] = request.routeTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenChildInstanceRouteEntryToCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenChildInstanceRouteEntryToCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenChildInstanceRouteEntryToCen(_ request: DeleteCenChildInstanceRouteEntryToCenRequest) async throws -> DeleteCenChildInstanceRouteEntryToCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenChildInstanceRouteEntryToCenWithOptions(request as! DeleteCenChildInstanceRouteEntryToCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenInterRegionTrafficQosPolicyWithOptions(_ request: DeleteCenInterRegionTrafficQosPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenInterRegionTrafficQosPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyId)) {
            query["TrafficQosPolicyId"] = request.trafficQosPolicyId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenInterRegionTrafficQosPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenInterRegionTrafficQosPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenInterRegionTrafficQosPolicy(_ request: DeleteCenInterRegionTrafficQosPolicyRequest) async throws -> DeleteCenInterRegionTrafficQosPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenInterRegionTrafficQosPolicyWithOptions(request as! DeleteCenInterRegionTrafficQosPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenInterRegionTrafficQosQueueWithOptions(_ request: DeleteCenInterRegionTrafficQosQueueRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenInterRegionTrafficQosQueueResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueId)) {
            query["QosQueueId"] = request.qosQueueId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenInterRegionTrafficQosQueue",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenInterRegionTrafficQosQueueResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenInterRegionTrafficQosQueue(_ request: DeleteCenInterRegionTrafficQosQueueRequest) async throws -> DeleteCenInterRegionTrafficQosQueueResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenInterRegionTrafficQosQueueWithOptions(request as! DeleteCenInterRegionTrafficQosQueueRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenRouteMapWithOptions(_ request: DeleteCenRouteMapRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteCenRouteMapResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenRegionId)) {
            query["CenRegionId"] = request.cenRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeMapId)) {
            query["RouteMapId"] = request.routeMapId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteCenRouteMap",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteCenRouteMapResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteCenRouteMap(_ request: DeleteCenRouteMapRequest) async throws -> DeleteCenRouteMapResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteCenRouteMapWithOptions(request as! DeleteCenRouteMapRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteFlowlogWithOptions(_ request: DeleteFlowlogRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteFlowlogResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogId)) {
            query["FlowLogId"] = request.flowLogId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteFlowlog",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteFlowlogResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteFlowlog(_ request: DeleteFlowlogRequest) async throws -> DeleteFlowlogResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteFlowlogWithOptions(request as! DeleteFlowlogRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteRouteServiceInCenWithOptions(_ request: DeleteRouteServiceInCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteRouteServiceInCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionId)) {
            query["AccessRegionId"] = request.accessRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.host)) {
            query["Host"] = request.host ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostRegionId)) {
            query["HostRegionId"] = request.hostRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostVpcId)) {
            query["HostVpcId"] = request.hostVpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteRouteServiceInCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteRouteServiceInCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteRouteServiceInCen(_ request: DeleteRouteServiceInCenRequest) async throws -> DeleteRouteServiceInCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteRouteServiceInCenWithOptions(request as! DeleteRouteServiceInCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTrafficMarkingPolicyWithOptions(_ request: DeleteTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTrafficMarkingPolicy(_ request: DeleteTrafficMarkingPolicyRequest) async throws -> DeleteTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTrafficMarkingPolicyWithOptions(request as! DeleteTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterWithOptions(_ request: DeleteTransitRouterRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouter",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouter(_ request: DeleteTransitRouterRequest) async throws -> DeleteTransitRouterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterWithOptions(request as! DeleteTransitRouterRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterMulticastDomainWithOptions(_ request: DeleteTransitRouterMulticastDomainRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterMulticastDomainResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterMulticastDomain",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterMulticastDomainResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterMulticastDomain(_ request: DeleteTransitRouterMulticastDomainRequest) async throws -> DeleteTransitRouterMulticastDomainResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterMulticastDomainWithOptions(request as! DeleteTransitRouterMulticastDomainRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterPeerAttachmentWithOptions(_ request: DeleteTransitRouterPeerAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterPeerAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterPeerAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterPeerAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterPeerAttachment(_ request: DeleteTransitRouterPeerAttachmentRequest) async throws -> DeleteTransitRouterPeerAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterPeerAttachmentWithOptions(request as! DeleteTransitRouterPeerAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterPrefixListAssociationWithOptions(_ request: DeleteTransitRouterPrefixListAssociationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterPrefixListAssociationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.nextHop)) {
            query["NextHop"] = request.nextHop ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.nextHopType)) {
            query["NextHopType"] = request.nextHopType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.prefixListId)) {
            query["PrefixListId"] = request.prefixListId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterTableId)) {
            query["TransitRouterTableId"] = request.transitRouterTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterPrefixListAssociation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterPrefixListAssociationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterPrefixListAssociation(_ request: DeleteTransitRouterPrefixListAssociationRequest) async throws -> DeleteTransitRouterPrefixListAssociationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterPrefixListAssociationWithOptions(request as! DeleteTransitRouterPrefixListAssociationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterRouteEntryWithOptions(_ request: DeleteTransitRouterRouteEntryRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterRouteEntryResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryDestinationCidrBlock)) {
            query["TransitRouterRouteEntryDestinationCidrBlock"] = request.transitRouterRouteEntryDestinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryId)) {
            query["TransitRouterRouteEntryId"] = request.transitRouterRouteEntryId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryNextHopId)) {
            query["TransitRouterRouteEntryNextHopId"] = request.transitRouterRouteEntryNextHopId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryNextHopType)) {
            query["TransitRouterRouteEntryNextHopType"] = request.transitRouterRouteEntryNextHopType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterRouteEntry",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterRouteEntryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterRouteEntry(_ request: DeleteTransitRouterRouteEntryRequest) async throws -> DeleteTransitRouterRouteEntryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterRouteEntryWithOptions(request as! DeleteTransitRouterRouteEntryRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterRouteTableWithOptions(_ request: DeleteTransitRouterRouteTableRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterRouteTableResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterRouteTable",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterRouteTableResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterRouteTable(_ request: DeleteTransitRouterRouteTableRequest) async throws -> DeleteTransitRouterRouteTableResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterRouteTableWithOptions(request as! DeleteTransitRouterRouteTableRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVbrAttachmentWithOptions(_ request: DeleteTransitRouterVbrAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterVbrAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterVbrAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterVbrAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVbrAttachment(_ request: DeleteTransitRouterVbrAttachmentRequest) async throws -> DeleteTransitRouterVbrAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterVbrAttachmentWithOptions(request as! DeleteTransitRouterVbrAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVpcAttachmentWithOptions(_ request: DeleteTransitRouterVpcAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterVpcAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterVpcAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterVpcAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVpcAttachment(_ request: DeleteTransitRouterVpcAttachmentRequest) async throws -> DeleteTransitRouterVpcAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterVpcAttachmentWithOptions(request as! DeleteTransitRouterVpcAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVpnAttachmentWithOptions(_ request: DeleteTransitRouterVpnAttachmentRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeleteTransitRouterVpnAttachmentResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeleteTransitRouterVpnAttachment",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeleteTransitRouterVpnAttachmentResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deleteTransitRouterVpnAttachment(_ request: DeleteTransitRouterVpnAttachmentRequest) async throws -> DeleteTransitRouterVpnAttachmentResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deleteTransitRouterVpnAttachmentWithOptions(request as! DeleteTransitRouterVpnAttachmentRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deregisterTransitRouterMulticastGroupMembersWithOptions(_ request: DeregisterTransitRouterMulticastGroupMembersRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeregisterTransitRouterMulticastGroupMembersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.groupIpAddress)) {
            query["GroupIpAddress"] = request.groupIpAddress ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.networkInterfaceIds)) {
            query["NetworkInterfaceIds"] = request.networkInterfaceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.peerTransitRouterMulticastDomains)) {
            query["PeerTransitRouterMulticastDomains"] = request.peerTransitRouterMulticastDomains ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeregisterTransitRouterMulticastGroupMembers",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeregisterTransitRouterMulticastGroupMembersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deregisterTransitRouterMulticastGroupMembers(_ request: DeregisterTransitRouterMulticastGroupMembersRequest) async throws -> DeregisterTransitRouterMulticastGroupMembersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deregisterTransitRouterMulticastGroupMembersWithOptions(request as! DeregisterTransitRouterMulticastGroupMembersRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deregisterTransitRouterMulticastGroupSourcesWithOptions(_ request: DeregisterTransitRouterMulticastGroupSourcesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DeregisterTransitRouterMulticastGroupSourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.groupIpAddress)) {
            query["GroupIpAddress"] = request.groupIpAddress ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.networkInterfaceIds)) {
            query["NetworkInterfaceIds"] = request.networkInterfaceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DeregisterTransitRouterMulticastGroupSources",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DeregisterTransitRouterMulticastGroupSourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func deregisterTransitRouterMulticastGroupSources(_ request: DeregisterTransitRouterMulticastGroupSourcesRequest) async throws -> DeregisterTransitRouterMulticastGroupSourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await deregisterTransitRouterMulticastGroupSourcesWithOptions(request as! DeregisterTransitRouterMulticastGroupSourcesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenAttachedChildInstanceAttributeWithOptions(_ request: DescribeCenAttachedChildInstanceAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenAttachedChildInstanceAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenAttachedChildInstanceAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenAttachedChildInstanceAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenAttachedChildInstanceAttribute(_ request: DescribeCenAttachedChildInstanceAttributeRequest) async throws -> DescribeCenAttachedChildInstanceAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenAttachedChildInstanceAttributeWithOptions(request as! DescribeCenAttachedChildInstanceAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenAttachedChildInstancesWithOptions(_ request: DescribeCenAttachedChildInstancesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenAttachedChildInstancesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenAttachedChildInstances",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenAttachedChildInstancesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenAttachedChildInstances(_ request: DescribeCenAttachedChildInstancesRequest) async throws -> DescribeCenAttachedChildInstancesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenAttachedChildInstancesWithOptions(request as! DescribeCenAttachedChildInstancesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenBandwidthPackagesWithOptions(_ request: DescribeCenBandwidthPackagesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenBandwidthPackagesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.filter)) {
            query["Filter"] = request.filter ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.includeReservationData)) {
            query["IncludeReservationData"] = request.includeReservationData!;
        }
        if (!TeaUtils.Client.isUnset(request.isOrKey)) {
            query["IsOrKey"] = request.isOrKey!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenBandwidthPackages",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenBandwidthPackagesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenBandwidthPackages(_ request: DescribeCenBandwidthPackagesRequest) async throws -> DescribeCenBandwidthPackagesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenBandwidthPackagesWithOptions(request as! DescribeCenBandwidthPackagesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenChildInstanceRouteEntriesWithOptions(_ request: DescribeCenChildInstanceRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenChildInstanceRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.status)) {
            query["Status"] = request.status ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenChildInstanceRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenChildInstanceRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenChildInstanceRouteEntries(_ request: DescribeCenChildInstanceRouteEntriesRequest) async throws -> DescribeCenChildInstanceRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenChildInstanceRouteEntriesWithOptions(request as! DescribeCenChildInstanceRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenGeographicSpanRemainingBandwidthWithOptions(_ request: DescribeCenGeographicSpanRemainingBandwidthRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenGeographicSpanRemainingBandwidthResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.geographicRegionAId)) {
            query["GeographicRegionAId"] = request.geographicRegionAId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.geographicRegionBId)) {
            query["GeographicRegionBId"] = request.geographicRegionBId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenGeographicSpanRemainingBandwidth",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenGeographicSpanRemainingBandwidthResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenGeographicSpanRemainingBandwidth(_ request: DescribeCenGeographicSpanRemainingBandwidthRequest) async throws -> DescribeCenGeographicSpanRemainingBandwidthResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenGeographicSpanRemainingBandwidthWithOptions(request as! DescribeCenGeographicSpanRemainingBandwidthRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenGeographicSpansWithOptions(_ request: DescribeCenGeographicSpansRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenGeographicSpansResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.geographicSpanId)) {
            query["GeographicSpanId"] = request.geographicSpanId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenGeographicSpans",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenGeographicSpansResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenGeographicSpans(_ request: DescribeCenGeographicSpansRequest) async throws -> DescribeCenGeographicSpansResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenGeographicSpansWithOptions(request as! DescribeCenGeographicSpansRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenInterRegionBandwidthLimitsWithOptions(_ request: DescribeCenInterRegionBandwidthLimitsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenInterRegionBandwidthLimitsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenInterRegionBandwidthLimits",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenInterRegionBandwidthLimitsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenInterRegionBandwidthLimits(_ request: DescribeCenInterRegionBandwidthLimitsRequest) async throws -> DescribeCenInterRegionBandwidthLimitsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenInterRegionBandwidthLimitsWithOptions(request as! DescribeCenInterRegionBandwidthLimitsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenPrivateZoneRoutesWithOptions(_ request: DescribeCenPrivateZoneRoutesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenPrivateZoneRoutesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionId)) {
            query["AccessRegionId"] = request.accessRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostRegionId)) {
            query["HostRegionId"] = request.hostRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenPrivateZoneRoutes",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenPrivateZoneRoutesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenPrivateZoneRoutes(_ request: DescribeCenPrivateZoneRoutesRequest) async throws -> DescribeCenPrivateZoneRoutesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenPrivateZoneRoutesWithOptions(request as! DescribeCenPrivateZoneRoutesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenRegionDomainRouteEntriesWithOptions(_ request: DescribeCenRegionDomainRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenRegionDomainRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenRegionId)) {
            query["CenRegionId"] = request.cenRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.status)) {
            query["Status"] = request.status ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenRegionDomainRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenRegionDomainRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenRegionDomainRouteEntries(_ request: DescribeCenRegionDomainRouteEntriesRequest) async throws -> DescribeCenRegionDomainRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenRegionDomainRouteEntriesWithOptions(request as! DescribeCenRegionDomainRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenRouteMapsWithOptions(_ request: DescribeCenRouteMapsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenRouteMapsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenRegionId)) {
            query["CenRegionId"] = request.cenRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeMapId)) {
            query["RouteMapId"] = request.routeMapId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transmitDirection)) {
            query["TransmitDirection"] = request.transmitDirection ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenRouteMaps",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenRouteMapsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenRouteMaps(_ request: DescribeCenRouteMapsRequest) async throws -> DescribeCenRouteMapsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenRouteMapsWithOptions(request as! DescribeCenRouteMapsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenVbrHealthCheckWithOptions(_ request: DescribeCenVbrHealthCheckRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenVbrHealthCheckResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceId)) {
            query["VbrInstanceId"] = request.vbrInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceOwnerId)) {
            query["VbrInstanceOwnerId"] = request.vbrInstanceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceRegionId)) {
            query["VbrInstanceRegionId"] = request.vbrInstanceRegionId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenVbrHealthCheck",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenVbrHealthCheckResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenVbrHealthCheck(_ request: DescribeCenVbrHealthCheckRequest) async throws -> DescribeCenVbrHealthCheckResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenVbrHealthCheckWithOptions(request as! DescribeCenVbrHealthCheckRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenVpcFlowStatisticSwitchWithOptions(_ request: DescribeCenVpcFlowStatisticSwitchRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCenVpcFlowStatisticSwitchResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCenVpcFlowStatisticSwitch",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCenVpcFlowStatisticSwitchResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCenVpcFlowStatisticSwitch(_ request: DescribeCenVpcFlowStatisticSwitchRequest) async throws -> DescribeCenVpcFlowStatisticSwitchResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCenVpcFlowStatisticSwitchWithOptions(request as! DescribeCenVpcFlowStatisticSwitchRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCensWithOptions(_ request: DescribeCensRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeCensResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.filter)) {
            query["Filter"] = request.filter ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.tag)) {
            query["Tag"] = request.tag ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeCens",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeCensResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeCens(_ request: DescribeCensRequest) async throws -> DescribeCensResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeCensWithOptions(request as! DescribeCensRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeChildInstanceRegionsWithOptions(_ request: DescribeChildInstanceRegionsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeChildInstanceRegionsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            query["ProductType"] = request.productType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeChildInstanceRegions",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeChildInstanceRegionsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeChildInstanceRegions(_ request: DescribeChildInstanceRegionsRequest) async throws -> DescribeChildInstanceRegionsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeChildInstanceRegionsWithOptions(request as! DescribeChildInstanceRegionsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeFlowlogsWithOptions(_ request: DescribeFlowlogsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeFlowlogsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogId)) {
            query["FlowLogId"] = request.flowLogId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogName)) {
            query["FlowLogName"] = request.flowLogName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.logStoreName)) {
            query["LogStoreName"] = request.logStoreName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.projectName)) {
            query["ProjectName"] = request.projectName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.status)) {
            query["Status"] = request.status ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeFlowlogs",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeFlowlogsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeFlowlogs(_ request: DescribeFlowlogsRequest) async throws -> DescribeFlowlogsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeFlowlogsWithOptions(request as! DescribeFlowlogsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGeographicRegionMembershipWithOptions(_ request: DescribeGeographicRegionMembershipRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeGeographicRegionMembershipResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.geographicRegionId)) {
            query["GeographicRegionId"] = request.geographicRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeGeographicRegionMembership",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeGeographicRegionMembershipResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGeographicRegionMembership(_ request: DescribeGeographicRegionMembershipRequest) async throws -> DescribeGeographicRegionMembershipResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeGeographicRegionMembershipWithOptions(request as! DescribeGeographicRegionMembershipRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGrantRulesToCenWithOptions(_ request: DescribeGrantRulesToCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeGrantRulesToCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            query["ProductType"] = request.productType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeGrantRulesToCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeGrantRulesToCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGrantRulesToCen(_ request: DescribeGrantRulesToCenRequest) async throws -> DescribeGrantRulesToCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeGrantRulesToCenWithOptions(request as! DescribeGrantRulesToCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGrantRulesToResourceWithOptions(_ request: DescribeGrantRulesToResourceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeGrantRulesToResourceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.productType)) {
            query["ProductType"] = request.productType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeGrantRulesToResource",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeGrantRulesToResourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeGrantRulesToResource(_ request: DescribeGrantRulesToResourceRequest) async throws -> DescribeGrantRulesToResourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeGrantRulesToResourceWithOptions(request as! DescribeGrantRulesToResourceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describePublishedRouteEntriesWithOptions(_ request: DescribePublishedRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribePublishedRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRouteTableId)) {
            query["ChildInstanceRouteTableId"] = request.childInstanceRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribePublishedRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribePublishedRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describePublishedRouteEntries(_ request: DescribePublishedRouteEntriesRequest) async throws -> DescribePublishedRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describePublishedRouteEntriesWithOptions(request as! DescribePublishedRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeRouteConflictWithOptions(_ request: DescribeRouteConflictRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeRouteConflictResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRouteTableId)) {
            query["ChildInstanceRouteTableId"] = request.childInstanceRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeRouteConflict",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeRouteConflictResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeRouteConflict(_ request: DescribeRouteConflictRequest) async throws -> DescribeRouteConflictResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeRouteConflictWithOptions(request as! DescribeRouteConflictRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeRouteServicesInCenWithOptions(_ request: DescribeRouteServicesInCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DescribeRouteServicesInCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionId)) {
            query["AccessRegionId"] = request.accessRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.host)) {
            query["Host"] = request.host ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostRegionId)) {
            query["HostRegionId"] = request.hostRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostVpcId)) {
            query["HostVpcId"] = request.hostVpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DescribeRouteServicesInCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DescribeRouteServicesInCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func describeRouteServicesInCen(_ request: DescribeRouteServicesInCenRequest) async throws -> DescribeRouteServicesInCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await describeRouteServicesInCenWithOptions(request as! DescribeRouteServicesInCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func detachCenChildInstanceWithOptions(_ request: DetachCenChildInstanceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DetachCenChildInstanceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenOwnerId)) {
            query["CenOwnerId"] = request.cenOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceOwnerId)) {
            query["ChildInstanceOwnerId"] = request.childInstanceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DetachCenChildInstance",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DetachCenChildInstanceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func detachCenChildInstance(_ request: DetachCenChildInstanceRequest) async throws -> DetachCenChildInstanceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await detachCenChildInstanceWithOptions(request as! DetachCenChildInstanceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableCenVbrHealthCheckWithOptions(_ request: DisableCenVbrHealthCheckRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DisableCenVbrHealthCheckResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceId)) {
            query["VbrInstanceId"] = request.vbrInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceOwnerId)) {
            query["VbrInstanceOwnerId"] = request.vbrInstanceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceRegionId)) {
            query["VbrInstanceRegionId"] = request.vbrInstanceRegionId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DisableCenVbrHealthCheck",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DisableCenVbrHealthCheckResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableCenVbrHealthCheck(_ request: DisableCenVbrHealthCheckRequest) async throws -> DisableCenVbrHealthCheckResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await disableCenVbrHealthCheckWithOptions(request as! DisableCenVbrHealthCheckRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableCenVpcFlowStatisticWithOptions(_ request: DisableCenVpcFlowStatisticRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DisableCenVpcFlowStatisticResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DisableCenVpcFlowStatistic",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DisableCenVpcFlowStatisticResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableCenVpcFlowStatistic(_ request: DisableCenVpcFlowStatisticRequest) async throws -> DisableCenVpcFlowStatisticResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await disableCenVpcFlowStatisticWithOptions(request as! DisableCenVpcFlowStatisticRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableTransitRouterRouteTablePropagationWithOptions(_ request: DisableTransitRouterRouteTablePropagationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DisableTransitRouterRouteTablePropagationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DisableTransitRouterRouteTablePropagation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DisableTransitRouterRouteTablePropagationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disableTransitRouterRouteTablePropagation(_ request: DisableTransitRouterRouteTablePropagationRequest) async throws -> DisableTransitRouterRouteTablePropagationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await disableTransitRouterRouteTablePropagationWithOptions(request as! DisableTransitRouterRouteTablePropagationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disassociateTransitRouterMulticastDomainWithOptions(_ request: DisassociateTransitRouterMulticastDomainRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DisassociateTransitRouterMulticastDomainResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchIds)) {
            query["VSwitchIds"] = request.vSwitchIds ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DisassociateTransitRouterMulticastDomain",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DisassociateTransitRouterMulticastDomainResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func disassociateTransitRouterMulticastDomain(_ request: DisassociateTransitRouterMulticastDomainRequest) async throws -> DisassociateTransitRouterMulticastDomainResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await disassociateTransitRouterMulticastDomainWithOptions(request as! DisassociateTransitRouterMulticastDomainRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func dissociateTransitRouterAttachmentFromRouteTableWithOptions(_ request: DissociateTransitRouterAttachmentFromRouteTableRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> DissociateTransitRouterAttachmentFromRouteTableResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "DissociateTransitRouterAttachmentFromRouteTable",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(DissociateTransitRouterAttachmentFromRouteTableResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func dissociateTransitRouterAttachmentFromRouteTable(_ request: DissociateTransitRouterAttachmentFromRouteTableRequest) async throws -> DissociateTransitRouterAttachmentFromRouteTableResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await dissociateTransitRouterAttachmentFromRouteTableWithOptions(request as! DissociateTransitRouterAttachmentFromRouteTableRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableCenVbrHealthCheckWithOptions(_ request: EnableCenVbrHealthCheckRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> EnableCenVbrHealthCheckResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.healthCheckInterval)) {
            query["HealthCheckInterval"] = request.healthCheckInterval!;
        }
        if (!TeaUtils.Client.isUnset(request.healthCheckOnly)) {
            query["HealthCheckOnly"] = request.healthCheckOnly!;
        }
        if (!TeaUtils.Client.isUnset(request.healthCheckSourceIp)) {
            query["HealthCheckSourceIp"] = request.healthCheckSourceIp ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.healthCheckTargetIp)) {
            query["HealthCheckTargetIp"] = request.healthCheckTargetIp ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.healthyThreshold)) {
            query["HealthyThreshold"] = request.healthyThreshold!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceId)) {
            query["VbrInstanceId"] = request.vbrInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceOwnerId)) {
            query["VbrInstanceOwnerId"] = request.vbrInstanceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vbrInstanceRegionId)) {
            query["VbrInstanceRegionId"] = request.vbrInstanceRegionId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "EnableCenVbrHealthCheck",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(EnableCenVbrHealthCheckResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableCenVbrHealthCheck(_ request: EnableCenVbrHealthCheckRequest) async throws -> EnableCenVbrHealthCheckResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await enableCenVbrHealthCheckWithOptions(request as! EnableCenVbrHealthCheckRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableCenVpcFlowStatisticWithOptions(_ request: EnableCenVpcFlowStatisticRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> EnableCenVpcFlowStatisticResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.days)) {
            query["Days"] = request.days!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "EnableCenVpcFlowStatistic",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(EnableCenVpcFlowStatisticResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableCenVpcFlowStatistic(_ request: EnableCenVpcFlowStatisticRequest) async throws -> EnableCenVpcFlowStatisticResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await enableCenVpcFlowStatisticWithOptions(request as! EnableCenVpcFlowStatisticRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableTransitRouterRouteTablePropagationWithOptions(_ request: EnableTransitRouterRouteTablePropagationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> EnableTransitRouterRouteTablePropagationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "EnableTransitRouterRouteTablePropagation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(EnableTransitRouterRouteTablePropagationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func enableTransitRouterRouteTablePropagation(_ request: EnableTransitRouterRouteTablePropagationRequest) async throws -> EnableTransitRouterRouteTablePropagationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await enableTransitRouterRouteTablePropagationWithOptions(request as! EnableTransitRouterRouteTablePropagationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func grantInstanceToTransitRouterWithOptions(_ request: GrantInstanceToTransitRouterRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> GrantInstanceToTransitRouterResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenOwnerId)) {
            query["CenOwnerId"] = request.cenOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.instanceId)) {
            query["InstanceId"] = request.instanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.instanceType)) {
            query["InstanceType"] = request.instanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.orderType)) {
            query["OrderType"] = request.orderType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "GrantInstanceToTransitRouter",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(GrantInstanceToTransitRouterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func grantInstanceToTransitRouter(_ request: GrantInstanceToTransitRouterRequest) async throws -> GrantInstanceToTransitRouterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await grantInstanceToTransitRouterWithOptions(request as! GrantInstanceToTransitRouterRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listCenInterRegionTrafficQosPoliciesWithOptions(_ request: ListCenInterRegionTrafficQosPoliciesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListCenInterRegionTrafficQosPoliciesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyDescription)) {
            query["TrafficQosPolicyDescription"] = request.trafficQosPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyId)) {
            query["TrafficQosPolicyId"] = request.trafficQosPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyName)) {
            query["TrafficQosPolicyName"] = request.trafficQosPolicyName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListCenInterRegionTrafficQosPolicies",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListCenInterRegionTrafficQosPoliciesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listCenInterRegionTrafficQosPolicies(_ request: ListCenInterRegionTrafficQosPoliciesRequest) async throws -> ListCenInterRegionTrafficQosPoliciesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listCenInterRegionTrafficQosPoliciesWithOptions(request as! ListCenInterRegionTrafficQosPoliciesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listGrantVSwitchEnisWithOptions(_ request: ListGrantVSwitchEnisRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListGrantVSwitchEnisResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchId)) {
            query["VSwitchId"] = request.vSwitchId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListGrantVSwitchEnis",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListGrantVSwitchEnisResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listGrantVSwitchEnis(_ request: ListGrantVSwitchEnisRequest) async throws -> ListGrantVSwitchEnisResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listGrantVSwitchEnisWithOptions(request as! ListGrantVSwitchEnisRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listGrantVSwitchesToCenWithOptions(_ request: ListGrantVSwitchesToCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListGrantVSwitchesToCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.zoneId)) {
            query["ZoneId"] = request.zoneId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListGrantVSwitchesToCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListGrantVSwitchesToCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listGrantVSwitchesToCen(_ request: ListGrantVSwitchesToCenRequest) async throws -> ListGrantVSwitchesToCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listGrantVSwitchesToCenWithOptions(request as! ListGrantVSwitchesToCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTagResourcesWithOptions(_ request: ListTagResourcesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTagResourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.tag)) {
            query["Tag"] = request.tag ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTagResources",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTagResourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTagResources(_ request: ListTagResourcesRequest) async throws -> ListTagResourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTagResourcesWithOptions(request as! ListTagResourcesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTrafficMarkingPoliciesWithOptions(_ request: ListTrafficMarkingPoliciesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTrafficMarkingPoliciesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyDescription)) {
            query["TrafficMarkingPolicyDescription"] = request.trafficMarkingPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyName)) {
            query["TrafficMarkingPolicyName"] = request.trafficMarkingPolicyName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTrafficMarkingPolicies",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTrafficMarkingPoliciesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTrafficMarkingPolicies(_ request: ListTrafficMarkingPoliciesRequest) async throws -> ListTrafficMarkingPoliciesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTrafficMarkingPoliciesWithOptions(request as! ListTrafficMarkingPoliciesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterAvailableResourceWithOptions(_ request: ListTransitRouterAvailableResourceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterAvailableResourceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.supportMulticast)) {
            query["SupportMulticast"] = request.supportMulticast!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterAvailableResource",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterAvailableResourceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterAvailableResource(_ request: ListTransitRouterAvailableResourceRequest) async throws -> ListTransitRouterAvailableResourceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterAvailableResourceWithOptions(request as! ListTransitRouterAvailableResourceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomainAssociationsWithOptions(_ request: ListTransitRouterMulticastDomainAssociationsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterMulticastDomainAssociationsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchIds)) {
            query["VSwitchIds"] = request.vSwitchIds ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterMulticastDomainAssociations",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterMulticastDomainAssociationsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomainAssociations(_ request: ListTransitRouterMulticastDomainAssociationsRequest) async throws -> ListTransitRouterMulticastDomainAssociationsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterMulticastDomainAssociationsWithOptions(request as! ListTransitRouterMulticastDomainAssociationsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomainVSwitchesWithOptions(_ request: ListTransitRouterMulticastDomainVSwitchesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterMulticastDomainVSwitchesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchIds)) {
            query["VSwitchIds"] = request.vSwitchIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterMulticastDomainVSwitches",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterMulticastDomainVSwitchesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomainVSwitches(_ request: ListTransitRouterMulticastDomainVSwitchesRequest) async throws -> ListTransitRouterMulticastDomainVSwitchesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterMulticastDomainVSwitchesWithOptions(request as! ListTransitRouterMulticastDomainVSwitchesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomainsWithOptions(_ request: ListTransitRouterMulticastDomainsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterMulticastDomainsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterMulticastDomains",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterMulticastDomainsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastDomains(_ request: ListTransitRouterMulticastDomainsRequest) async throws -> ListTransitRouterMulticastDomainsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterMulticastDomainsWithOptions(request as! ListTransitRouterMulticastDomainsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastGroupsWithOptions(_ request: ListTransitRouterMulticastGroupsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterMulticastGroupsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.groupIpAddress)) {
            query["GroupIpAddress"] = request.groupIpAddress ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.peerTransitRouterMulticastDomains)) {
            query["PeerTransitRouterMulticastDomains"] = request.peerTransitRouterMulticastDomains ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vSwitchIds)) {
            query["VSwitchIds"] = request.vSwitchIds ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterMulticastGroups",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterMulticastGroupsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterMulticastGroups(_ request: ListTransitRouterMulticastGroupsRequest) async throws -> ListTransitRouterMulticastGroupsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterMulticastGroupsWithOptions(request as! ListTransitRouterMulticastGroupsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterPeerAttachmentsWithOptions(_ request: ListTransitRouterPeerAttachmentsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterPeerAttachmentsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterPeerAttachments",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterPeerAttachmentsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterPeerAttachments(_ request: ListTransitRouterPeerAttachmentsRequest) async throws -> ListTransitRouterPeerAttachmentsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterPeerAttachmentsWithOptions(request as! ListTransitRouterPeerAttachmentsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterPrefixListAssociationWithOptions(_ request: ListTransitRouterPrefixListAssociationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterPrefixListAssociationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerUid)) {
            query["OwnerUid"] = request.ownerUid!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.prefixListId)) {
            query["PrefixListId"] = request.prefixListId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterTableId)) {
            query["TransitRouterTableId"] = request.transitRouterTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterPrefixListAssociation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterPrefixListAssociationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterPrefixListAssociation(_ request: ListTransitRouterPrefixListAssociationRequest) async throws -> ListTransitRouterPrefixListAssociationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterPrefixListAssociationWithOptions(request as! ListTransitRouterPrefixListAssociationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteEntriesWithOptions(_ request: ListTransitRouterRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryDestinationCidrBlock)) {
            query["TransitRouterRouteEntryDestinationCidrBlock"] = request.transitRouterRouteEntryDestinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryIds)) {
            query["TransitRouterRouteEntryIds"] = request.transitRouterRouteEntryIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryNames)) {
            query["TransitRouterRouteEntryNames"] = request.transitRouterRouteEntryNames ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryStatus)) {
            query["TransitRouterRouteEntryStatus"] = request.transitRouterRouteEntryStatus ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteEntries(_ request: ListTransitRouterRouteEntriesRequest) async throws -> ListTransitRouterRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterRouteEntriesWithOptions(request as! ListTransitRouterRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTableAssociationsWithOptions(_ request: ListTransitRouterRouteTableAssociationsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterRouteTableAssociationsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterRouteTableAssociations",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterRouteTableAssociationsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTableAssociations(_ request: ListTransitRouterRouteTableAssociationsRequest) async throws -> ListTransitRouterRouteTableAssociationsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterRouteTableAssociationsWithOptions(request as! ListTransitRouterRouteTableAssociationsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTablePropagationsWithOptions(_ request: ListTransitRouterRouteTablePropagationsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterRouteTablePropagationsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterRouteTablePropagations",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterRouteTablePropagationsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTablePropagations(_ request: ListTransitRouterRouteTablePropagationsRequest) async throws -> ListTransitRouterRouteTablePropagationsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterRouteTablePropagationsWithOptions(request as! ListTransitRouterRouteTablePropagationsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTablesWithOptions(_ request: ListTransitRouterRouteTablesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterRouteTablesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableIds)) {
            query["TransitRouterRouteTableIds"] = request.transitRouterRouteTableIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableNames)) {
            query["TransitRouterRouteTableNames"] = request.transitRouterRouteTableNames ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableStatus)) {
            query["TransitRouterRouteTableStatus"] = request.transitRouterRouteTableStatus ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableType)) {
            query["TransitRouterRouteTableType"] = request.transitRouterRouteTableType ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterRouteTables",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterRouteTablesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterRouteTables(_ request: ListTransitRouterRouteTablesRequest) async throws -> ListTransitRouterRouteTablesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterRouteTablesWithOptions(request as! ListTransitRouterRouteTablesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVbrAttachmentsWithOptions(_ request: ListTransitRouterVbrAttachmentsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterVbrAttachmentsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterVbrAttachments",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterVbrAttachmentsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVbrAttachments(_ request: ListTransitRouterVbrAttachmentsRequest) async throws -> ListTransitRouterVbrAttachmentsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterVbrAttachmentsWithOptions(request as! ListTransitRouterVbrAttachmentsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVpcAttachmentsWithOptions(_ request: ListTransitRouterVpcAttachmentsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterVpcAttachmentsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterVpcAttachments",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterVpcAttachmentsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVpcAttachments(_ request: ListTransitRouterVpcAttachmentsRequest) async throws -> ListTransitRouterVpcAttachmentsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterVpcAttachmentsWithOptions(request as! ListTransitRouterVpcAttachmentsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVpnAttachmentsWithOptions(_ request: ListTransitRouterVpnAttachmentsRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRouterVpnAttachmentsResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.maxResults)) {
            query["MaxResults"] = request.maxResults!;
        }
        if (!TeaUtils.Client.isUnset(request.nextToken)) {
            query["NextToken"] = request.nextToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouterVpnAttachments",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRouterVpnAttachmentsResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouterVpnAttachments(_ request: ListTransitRouterVpnAttachmentsRequest) async throws -> ListTransitRouterVpnAttachmentsResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRouterVpnAttachmentsWithOptions(request as! ListTransitRouterVpnAttachmentsRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRoutersWithOptions(_ request: ListTransitRoutersRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ListTransitRoutersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.pageNumber)) {
            query["PageNumber"] = request.pageNumber!;
        }
        if (!TeaUtils.Client.isUnset(request.pageSize)) {
            query["PageSize"] = request.pageSize!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ListTransitRouters",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ListTransitRoutersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func listTransitRouters(_ request: ListTransitRoutersRequest) async throws -> ListTransitRoutersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await listTransitRoutersWithOptions(request as! ListTransitRoutersRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenAttributeWithOptions(_ request: ModifyCenAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyCenAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.protectionLevel)) {
            query["ProtectionLevel"] = request.protectionLevel ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyCenAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyCenAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenAttribute(_ request: ModifyCenAttributeRequest) async throws -> ModifyCenAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyCenAttributeWithOptions(request as! ModifyCenAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenBandwidthPackageAttributeWithOptions(_ request: ModifyCenBandwidthPackageAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyCenBandwidthPackageAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.name)) {
            query["Name"] = request.name ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyCenBandwidthPackageAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyCenBandwidthPackageAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenBandwidthPackageAttribute(_ request: ModifyCenBandwidthPackageAttributeRequest) async throws -> ModifyCenBandwidthPackageAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyCenBandwidthPackageAttributeWithOptions(request as! ModifyCenBandwidthPackageAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenBandwidthPackageSpecWithOptions(_ request: ModifyCenBandwidthPackageSpecRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyCenBandwidthPackageSpecResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.bandwidth)) {
            query["Bandwidth"] = request.bandwidth!;
        }
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyCenBandwidthPackageSpec",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyCenBandwidthPackageSpecResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenBandwidthPackageSpec(_ request: ModifyCenBandwidthPackageSpecRequest) async throws -> ModifyCenBandwidthPackageSpecResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyCenBandwidthPackageSpecWithOptions(request as! ModifyCenBandwidthPackageSpecRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenRouteMapWithOptions(_ request: ModifyCenRouteMapRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyCenRouteMapResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.asPathMatchMode)) {
            query["AsPathMatchMode"] = request.asPathMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenRegionId)) {
            query["CenRegionId"] = request.cenRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cidrMatchMode)) {
            query["CidrMatchMode"] = request.cidrMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.communityMatchMode)) {
            query["CommunityMatchMode"] = request.communityMatchMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.communityOperateMode)) {
            query["CommunityOperateMode"] = request.communityOperateMode ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationChildInstanceTypes)) {
            query["DestinationChildInstanceTypes"] = request.destinationChildInstanceTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlocks)) {
            query["DestinationCidrBlocks"] = request.destinationCidrBlocks ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationInstanceIds)) {
            query["DestinationInstanceIds"] = request.destinationInstanceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.destinationInstanceIdsReverseMatch)) {
            query["DestinationInstanceIdsReverseMatch"] = request.destinationInstanceIdsReverseMatch!;
        }
        if (!TeaUtils.Client.isUnset(request.destinationRouteTableIds)) {
            query["DestinationRouteTableIds"] = request.destinationRouteTableIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.mapResult)) {
            query["MapResult"] = request.mapResult ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.matchAddressType)) {
            query["MatchAddressType"] = request.matchAddressType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.matchAsns)) {
            query["MatchAsns"] = request.matchAsns ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.matchCommunitySet)) {
            query["MatchCommunitySet"] = request.matchCommunitySet ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.nextPriority)) {
            query["NextPriority"] = request.nextPriority!;
        }
        if (!TeaUtils.Client.isUnset(request.operateCommunitySet)) {
            query["OperateCommunitySet"] = request.operateCommunitySet ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.preference)) {
            query["Preference"] = request.preference!;
        }
        if (!TeaUtils.Client.isUnset(request.prependAsPath)) {
            query["PrependAsPath"] = request.prependAsPath ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.priority)) {
            query["Priority"] = request.priority!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.routeMapId)) {
            query["RouteMapId"] = request.routeMapId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.routeTypes)) {
            query["RouteTypes"] = request.routeTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceChildInstanceTypes)) {
            query["SourceChildInstanceTypes"] = request.sourceChildInstanceTypes ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceInstanceIds)) {
            query["SourceInstanceIds"] = request.sourceInstanceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceInstanceIdsReverseMatch)) {
            query["SourceInstanceIdsReverseMatch"] = request.sourceInstanceIdsReverseMatch!;
        }
        if (!TeaUtils.Client.isUnset(request.sourceRegionIds)) {
            query["SourceRegionIds"] = request.sourceRegionIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.sourceRouteTableIds)) {
            query["SourceRouteTableIds"] = request.sourceRouteTableIds ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyCenRouteMap",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyCenRouteMapResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyCenRouteMap(_ request: ModifyCenRouteMapRequest) async throws -> ModifyCenRouteMapResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyCenRouteMapWithOptions(request as! ModifyCenRouteMapRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyFlowLogAttributeWithOptions(_ request: ModifyFlowLogAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyFlowLogAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogId)) {
            query["FlowLogId"] = request.flowLogId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.flowLogName)) {
            query["FlowLogName"] = request.flowLogName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyFlowLogAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyFlowLogAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyFlowLogAttribute(_ request: ModifyFlowLogAttributeRequest) async throws -> ModifyFlowLogAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyFlowLogAttributeWithOptions(request as! ModifyFlowLogAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyTransitRouterMulticastDomainWithOptions(_ request: ModifyTransitRouterMulticastDomainRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ModifyTransitRouterMulticastDomainResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainDescription)) {
            query["TransitRouterMulticastDomainDescription"] = request.transitRouterMulticastDomainDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainName)) {
            query["TransitRouterMulticastDomainName"] = request.transitRouterMulticastDomainName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ModifyTransitRouterMulticastDomain",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ModifyTransitRouterMulticastDomainResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func modifyTransitRouterMulticastDomain(_ request: ModifyTransitRouterMulticastDomainRequest) async throws -> ModifyTransitRouterMulticastDomainResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await modifyTransitRouterMulticastDomainWithOptions(request as! ModifyTransitRouterMulticastDomainRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func moveResourceGroupWithOptions(_ request: MoveResourceGroupRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> MoveResourceGroupResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.newResourceGroupId)) {
            query["NewResourceGroupId"] = request.newResourceGroupId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "MoveResourceGroup",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(MoveResourceGroupResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func moveResourceGroup(_ request: MoveResourceGroupRequest) async throws -> MoveResourceGroupResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await moveResourceGroupWithOptions(request as! MoveResourceGroupRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func openTransitRouterServiceWithOptions(_ request: OpenTransitRouterServiceRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> OpenTransitRouterServiceResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "OpenTransitRouterService",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(OpenTransitRouterServiceResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func openTransitRouterService(_ request: OpenTransitRouterServiceRequest) async throws -> OpenTransitRouterServiceResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await openTransitRouterServiceWithOptions(request as! OpenTransitRouterServiceRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishRouteEntriesWithOptions(_ request: PublishRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> PublishRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRouteTableId)) {
            query["ChildInstanceRouteTableId"] = request.childInstanceRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "PublishRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(PublishRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func publishRouteEntries(_ request: PublishRouteEntriesRequest) async throws -> PublishRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await publishRouteEntriesWithOptions(request as! PublishRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func registerTransitRouterMulticastGroupMembersWithOptions(_ request: RegisterTransitRouterMulticastGroupMembersRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RegisterTransitRouterMulticastGroupMembersResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.groupIpAddress)) {
            query["GroupIpAddress"] = request.groupIpAddress ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.networkInterfaceIds)) {
            query["NetworkInterfaceIds"] = request.networkInterfaceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.peerTransitRouterMulticastDomains)) {
            query["PeerTransitRouterMulticastDomains"] = request.peerTransitRouterMulticastDomains ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RegisterTransitRouterMulticastGroupMembers",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RegisterTransitRouterMulticastGroupMembersResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func registerTransitRouterMulticastGroupMembers(_ request: RegisterTransitRouterMulticastGroupMembersRequest) async throws -> RegisterTransitRouterMulticastGroupMembersResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await registerTransitRouterMulticastGroupMembersWithOptions(request as! RegisterTransitRouterMulticastGroupMembersRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func registerTransitRouterMulticastGroupSourcesWithOptions(_ request: RegisterTransitRouterMulticastGroupSourcesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RegisterTransitRouterMulticastGroupSourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.groupIpAddress)) {
            query["GroupIpAddress"] = request.groupIpAddress ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.networkInterfaceIds)) {
            query["NetworkInterfaceIds"] = request.networkInterfaceIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterMulticastDomainId)) {
            query["TransitRouterMulticastDomainId"] = request.transitRouterMulticastDomainId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.vpcId)) {
            query["VpcId"] = request.vpcId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RegisterTransitRouterMulticastGroupSources",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RegisterTransitRouterMulticastGroupSourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func registerTransitRouterMulticastGroupSources(_ request: RegisterTransitRouterMulticastGroupSourcesRequest) async throws -> RegisterTransitRouterMulticastGroupSourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await registerTransitRouterMulticastGroupSourcesWithOptions(request as! RegisterTransitRouterMulticastGroupSourcesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeTrafficMatchRuleFromTrafficMarkingPolicyWithOptions(_ request: RemoveTrafficMatchRuleFromTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveTrafficMatchRuleFromTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkRuleIds)) {
            query["TrafficMarkRuleIds"] = request.trafficMarkRuleIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveTrafficMatchRuleFromTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveTrafficMatchRuleFromTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeTrafficMatchRuleFromTrafficMarkingPolicy(_ request: RemoveTrafficMatchRuleFromTrafficMarkingPolicyRequest) async throws -> RemoveTrafficMatchRuleFromTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await removeTrafficMatchRuleFromTrafficMarkingPolicyWithOptions(request as! RemoveTrafficMatchRuleFromTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeTraficMatchRuleFromTrafficMarkingPolicyWithOptions(_ request: RemoveTraficMatchRuleFromTrafficMarkingPolicyRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RemoveTraficMatchRuleFromTrafficMarkingPolicyResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkRuleIds)) {
            query["TrafficMarkRuleIds"] = request.trafficMarkRuleIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RemoveTraficMatchRuleFromTrafficMarkingPolicy",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RemoveTraficMatchRuleFromTrafficMarkingPolicyResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func removeTraficMatchRuleFromTrafficMarkingPolicy(_ request: RemoveTraficMatchRuleFromTrafficMarkingPolicyRequest) async throws -> RemoveTraficMatchRuleFromTrafficMarkingPolicyResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await removeTraficMatchRuleFromTrafficMarkingPolicyWithOptions(request as! RemoveTraficMatchRuleFromTrafficMarkingPolicyRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func replaceTransitRouterRouteTableAssociationWithOptions(_ request: ReplaceTransitRouterRouteTableAssociationRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ReplaceTransitRouterRouteTableAssociationResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ReplaceTransitRouterRouteTableAssociation",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ReplaceTransitRouterRouteTableAssociationResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func replaceTransitRouterRouteTableAssociation(_ request: ReplaceTransitRouterRouteTableAssociationRequest) async throws -> ReplaceTransitRouterRouteTableAssociationResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await replaceTransitRouterRouteTableAssociationWithOptions(request as! ReplaceTransitRouterRouteTableAssociationRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func resolveAndRouteServiceInCenWithOptions(_ request: ResolveAndRouteServiceInCenRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> ResolveAndRouteServiceInCenResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionIds)) {
            query["AccessRegionIds"] = request.accessRegionIds ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.description_)) {
            query["Description"] = request.description_ ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.host)) {
            query["Host"] = request.host ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostRegionId)) {
            query["HostRegionId"] = request.hostRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostVpcId)) {
            query["HostVpcId"] = request.hostVpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "ResolveAndRouteServiceInCen",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(ResolveAndRouteServiceInCenResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func resolveAndRouteServiceInCen(_ request: ResolveAndRouteServiceInCenRequest) async throws -> ResolveAndRouteServiceInCenResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await resolveAndRouteServiceInCenWithOptions(request as! ResolveAndRouteServiceInCenRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func revokeInstanceFromTransitRouterWithOptions(_ request: RevokeInstanceFromTransitRouterRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RevokeInstanceFromTransitRouterResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenOwnerId)) {
            query["CenOwnerId"] = request.cenOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.instanceId)) {
            query["InstanceId"] = request.instanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.instanceType)) {
            query["InstanceType"] = request.instanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RevokeInstanceFromTransitRouter",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RevokeInstanceFromTransitRouterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func revokeInstanceFromTransitRouter(_ request: RevokeInstanceFromTransitRouterRequest) async throws -> RevokeInstanceFromTransitRouterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await revokeInstanceFromTransitRouterWithOptions(request as! RevokeInstanceFromTransitRouterRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func routePrivateZoneInCenToVpcWithOptions(_ request: RoutePrivateZoneInCenToVpcRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> RoutePrivateZoneInCenToVpcResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionId)) {
            query["AccessRegionId"] = request.accessRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostRegionId)) {
            query["HostRegionId"] = request.hostRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.hostVpcId)) {
            query["HostVpcId"] = request.hostVpcId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "RoutePrivateZoneInCenToVpc",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(RoutePrivateZoneInCenToVpcResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func routePrivateZoneInCenToVpc(_ request: RoutePrivateZoneInCenToVpcRequest) async throws -> RoutePrivateZoneInCenToVpcResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await routePrivateZoneInCenToVpcWithOptions(request as! RoutePrivateZoneInCenToVpcRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func setCenInterRegionBandwidthLimitWithOptions(_ request: SetCenInterRegionBandwidthLimitRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> SetCenInterRegionBandwidthLimitResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.bandwidthLimit)) {
            query["BandwidthLimit"] = request.bandwidthLimit!;
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.localRegionId)) {
            query["LocalRegionId"] = request.localRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.oppositeRegionId)) {
            query["OppositeRegionId"] = request.oppositeRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "SetCenInterRegionBandwidthLimit",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(SetCenInterRegionBandwidthLimitResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func setCenInterRegionBandwidthLimit(_ request: SetCenInterRegionBandwidthLimitRequest) async throws -> SetCenInterRegionBandwidthLimitResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await setCenInterRegionBandwidthLimitWithOptions(request as! SetCenInterRegionBandwidthLimitRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func tagResourcesWithOptions(_ request: TagResourcesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> TagResourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.tag)) {
            query["Tag"] = request.tag ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "TagResources",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(TagResourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func tagResources(_ request: TagResourcesRequest) async throws -> TagResourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await tagResourcesWithOptions(request as! TagResourcesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func tempUpgradeCenBandwidthPackageSpecWithOptions(_ request: TempUpgradeCenBandwidthPackageSpecRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> TempUpgradeCenBandwidthPackageSpecResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.bandwidth)) {
            query["Bandwidth"] = request.bandwidth!;
        }
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.endTime)) {
            query["EndTime"] = request.endTime ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "TempUpgradeCenBandwidthPackageSpec",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(TempUpgradeCenBandwidthPackageSpecResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func tempUpgradeCenBandwidthPackageSpec(_ request: TempUpgradeCenBandwidthPackageSpecRequest) async throws -> TempUpgradeCenBandwidthPackageSpecResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await tempUpgradeCenBandwidthPackageSpecWithOptions(request as! TempUpgradeCenBandwidthPackageSpecRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func unassociateCenBandwidthPackageWithOptions(_ request: UnassociateCenBandwidthPackageRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UnassociateCenBandwidthPackageResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UnassociateCenBandwidthPackage",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UnassociateCenBandwidthPackageResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func unassociateCenBandwidthPackage(_ request: UnassociateCenBandwidthPackageRequest) async throws -> UnassociateCenBandwidthPackageResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await unassociateCenBandwidthPackageWithOptions(request as! UnassociateCenBandwidthPackageRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func unroutePrivateZoneInCenToVpcWithOptions(_ request: UnroutePrivateZoneInCenToVpcRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UnroutePrivateZoneInCenToVpcResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.accessRegionId)) {
            query["AccessRegionId"] = request.accessRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UnroutePrivateZoneInCenToVpc",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UnroutePrivateZoneInCenToVpcResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func unroutePrivateZoneInCenToVpc(_ request: UnroutePrivateZoneInCenToVpcRequest) async throws -> UnroutePrivateZoneInCenToVpcResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await unroutePrivateZoneInCenToVpcWithOptions(request as! UnroutePrivateZoneInCenToVpcRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func untagResourcesWithOptions(_ request: UntagResourcesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UntagResourcesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.all)) {
            query["All"] = request.all!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceId)) {
            query["ResourceId"] = request.resourceId ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceType)) {
            query["ResourceType"] = request.resourceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.tagKey)) {
            query["TagKey"] = request.tagKey ?? [];
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UntagResources",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UntagResourcesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func untagResources(_ request: UntagResourcesRequest) async throws -> UntagResourcesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await untagResourcesWithOptions(request as! UntagResourcesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateCenInterRegionTrafficQosPolicyAttributeWithOptions(_ request: UpdateCenInterRegionTrafficQosPolicyAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateCenInterRegionTrafficQosPolicyAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyDescription)) {
            query["TrafficQosPolicyDescription"] = request.trafficQosPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyId)) {
            query["TrafficQosPolicyId"] = request.trafficQosPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficQosPolicyName)) {
            query["TrafficQosPolicyName"] = request.trafficQosPolicyName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateCenInterRegionTrafficQosPolicyAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateCenInterRegionTrafficQosPolicyAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateCenInterRegionTrafficQosPolicyAttribute(_ request: UpdateCenInterRegionTrafficQosPolicyAttributeRequest) async throws -> UpdateCenInterRegionTrafficQosPolicyAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateCenInterRegionTrafficQosPolicyAttributeWithOptions(request as! UpdateCenInterRegionTrafficQosPolicyAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateCenInterRegionTrafficQosQueueAttributeWithOptions(_ request: UpdateCenInterRegionTrafficQosQueueAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateCenInterRegionTrafficQosQueueAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.dscps)) {
            query["Dscps"] = request.dscps ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueDescription)) {
            query["QosQueueDescription"] = request.qosQueueDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueId)) {
            query["QosQueueId"] = request.qosQueueId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.qosQueueName)) {
            query["QosQueueName"] = request.qosQueueName ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.remainBandwidthPercent)) {
            query["RemainBandwidthPercent"] = request.remainBandwidthPercent ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateCenInterRegionTrafficQosQueueAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateCenInterRegionTrafficQosQueueAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateCenInterRegionTrafficQosQueueAttribute(_ request: UpdateCenInterRegionTrafficQosQueueAttributeRequest) async throws -> UpdateCenInterRegionTrafficQosQueueAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateCenInterRegionTrafficQosQueueAttributeWithOptions(request as! UpdateCenInterRegionTrafficQosQueueAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTrafficMarkingPolicyAttributeWithOptions(_ request: UpdateTrafficMarkingPolicyAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTrafficMarkingPolicyAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyDescription)) {
            query["TrafficMarkingPolicyDescription"] = request.trafficMarkingPolicyDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyId)) {
            query["TrafficMarkingPolicyId"] = request.trafficMarkingPolicyId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.trafficMarkingPolicyName)) {
            query["TrafficMarkingPolicyName"] = request.trafficMarkingPolicyName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTrafficMarkingPolicyAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTrafficMarkingPolicyAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTrafficMarkingPolicyAttribute(_ request: UpdateTrafficMarkingPolicyAttributeRequest) async throws -> UpdateTrafficMarkingPolicyAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTrafficMarkingPolicyAttributeWithOptions(request as! UpdateTrafficMarkingPolicyAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterWithOptions(_ request: UpdateTransitRouterRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.regionId)) {
            query["RegionId"] = request.regionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterDescription)) {
            query["TransitRouterDescription"] = request.transitRouterDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterId)) {
            query["TransitRouterId"] = request.transitRouterId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterName)) {
            query["TransitRouterName"] = request.transitRouterName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouter",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouter(_ request: UpdateTransitRouterRequest) async throws -> UpdateTransitRouterResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterWithOptions(request as! UpdateTransitRouterRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterPeerAttachmentAttributeWithOptions(_ request: UpdateTransitRouterPeerAttachmentAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterPeerAttachmentAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidth)) {
            query["Bandwidth"] = request.bandwidth!;
        }
        if (!TeaUtils.Client.isUnset(request.bandwidthType)) {
            query["BandwidthType"] = request.bandwidthType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.cenBandwidthPackageId)) {
            query["CenBandwidthPackageId"] = request.cenBandwidthPackageId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterPeerAttachmentAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterPeerAttachmentAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterPeerAttachmentAttribute(_ request: UpdateTransitRouterPeerAttachmentAttributeRequest) async throws -> UpdateTransitRouterPeerAttachmentAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterPeerAttachmentAttributeWithOptions(request as! UpdateTransitRouterPeerAttachmentAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterRouteEntryWithOptions(_ request: UpdateTransitRouterRouteEntryRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterRouteEntryResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryDescription)) {
            query["TransitRouterRouteEntryDescription"] = request.transitRouterRouteEntryDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryId)) {
            query["TransitRouterRouteEntryId"] = request.transitRouterRouteEntryId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteEntryName)) {
            query["TransitRouterRouteEntryName"] = request.transitRouterRouteEntryName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterRouteEntry",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterRouteEntryResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterRouteEntry(_ request: UpdateTransitRouterRouteEntryRequest) async throws -> UpdateTransitRouterRouteEntryResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterRouteEntryWithOptions(request as! UpdateTransitRouterRouteEntryRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterRouteTableWithOptions(_ request: UpdateTransitRouterRouteTableRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterRouteTableResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableDescription)) {
            query["TransitRouterRouteTableDescription"] = request.transitRouterRouteTableDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableId)) {
            query["TransitRouterRouteTableId"] = request.transitRouterRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterRouteTableName)) {
            query["TransitRouterRouteTableName"] = request.transitRouterRouteTableName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterRouteTable",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterRouteTableResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterRouteTable(_ request: UpdateTransitRouterRouteTableRequest) async throws -> UpdateTransitRouterRouteTableResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterRouteTableWithOptions(request as! UpdateTransitRouterRouteTableRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVbrAttachmentAttributeWithOptions(_ request: UpdateTransitRouterVbrAttachmentAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterVbrAttachmentAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterVbrAttachmentAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterVbrAttachmentAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVbrAttachmentAttribute(_ request: UpdateTransitRouterVbrAttachmentAttributeRequest) async throws -> UpdateTransitRouterVbrAttachmentAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterVbrAttachmentAttributeWithOptions(request as! UpdateTransitRouterVbrAttachmentAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpcAttachmentAttributeWithOptions(_ request: UpdateTransitRouterVpcAttachmentAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterVpcAttachmentAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterVpcAttachmentAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterVpcAttachmentAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpcAttachmentAttribute(_ request: UpdateTransitRouterVpcAttachmentAttributeRequest) async throws -> UpdateTransitRouterVpcAttachmentAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterVpcAttachmentAttributeWithOptions(request as! UpdateTransitRouterVpcAttachmentAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpcAttachmentZonesWithOptions(_ request: UpdateTransitRouterVpcAttachmentZonesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterVpcAttachmentZonesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.addZoneMappings)) {
            query["AddZoneMappings"] = request.addZoneMappings ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.removeZoneMappings)) {
            query["RemoveZoneMappings"] = request.removeZoneMappings ?? [];
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterVpcAttachmentZones",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterVpcAttachmentZonesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpcAttachmentZones(_ request: UpdateTransitRouterVpcAttachmentZonesRequest) async throws -> UpdateTransitRouterVpcAttachmentZonesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterVpcAttachmentZonesWithOptions(request as! UpdateTransitRouterVpcAttachmentZonesRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpnAttachmentAttributeWithOptions(_ request: UpdateTransitRouterVpnAttachmentAttributeRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> UpdateTransitRouterVpnAttachmentAttributeResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.autoPublishRouteEnabled)) {
            query["AutoPublishRouteEnabled"] = request.autoPublishRouteEnabled!;
        }
        if (!TeaUtils.Client.isUnset(request.clientToken)) {
            query["ClientToken"] = request.clientToken ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.dryRun)) {
            query["DryRun"] = request.dryRun!;
        }
        if (!TeaUtils.Client.isUnset(request.ownerAccount)) {
            query["OwnerAccount"] = request.ownerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.ownerId)) {
            query["OwnerId"] = request.ownerId!;
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentDescription)) {
            query["TransitRouterAttachmentDescription"] = request.transitRouterAttachmentDescription ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentId)) {
            query["TransitRouterAttachmentId"] = request.transitRouterAttachmentId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.transitRouterAttachmentName)) {
            query["TransitRouterAttachmentName"] = request.transitRouterAttachmentName ?? "";
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "UpdateTransitRouterVpnAttachmentAttribute",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(UpdateTransitRouterVpnAttachmentAttributeResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func updateTransitRouterVpnAttachmentAttribute(_ request: UpdateTransitRouterVpnAttachmentAttributeRequest) async throws -> UpdateTransitRouterVpnAttachmentAttributeResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await updateTransitRouterVpnAttachmentAttributeWithOptions(request as! UpdateTransitRouterVpnAttachmentAttributeRequest, runtime as! TeaUtils.RuntimeOptions)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func withdrawPublishedRouteEntriesWithOptions(_ request: WithdrawPublishedRouteEntriesRequest, _ runtime: TeaUtils.RuntimeOptions) async throws -> WithdrawPublishedRouteEntriesResponse {
        try TeaUtils.Client.validateModel(request)
        var query: [String: Any] = [:]
        if (!TeaUtils.Client.isUnset(request.cenId)) {
            query["CenId"] = request.cenId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceId)) {
            query["ChildInstanceId"] = request.childInstanceId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRegionId)) {
            query["ChildInstanceRegionId"] = request.childInstanceRegionId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceRouteTableId)) {
            query["ChildInstanceRouteTableId"] = request.childInstanceRouteTableId ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.childInstanceType)) {
            query["ChildInstanceType"] = request.childInstanceType ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.destinationCidrBlock)) {
            query["DestinationCidrBlock"] = request.destinationCidrBlock ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerAccount)) {
            query["ResourceOwnerAccount"] = request.resourceOwnerAccount ?? "";
        }
        if (!TeaUtils.Client.isUnset(request.resourceOwnerId)) {
            query["ResourceOwnerId"] = request.resourceOwnerId!;
        }
        var req: AlibabacloudOpenApi.OpenApiRequest = AlibabacloudOpenApi.OpenApiRequest([
            "query": AlibabaCloudOpenApiUtil.Client.query(query)
        ])
        var params: AlibabacloudOpenApi.Params = AlibabacloudOpenApi.Params([
            "action": "WithdrawPublishedRouteEntries",
            "version": "2017-09-12",
            "protocol": "HTTPS",
            "pathname": "/",
            "method": "POST",
            "authType": "AK",
            "style": "RPC",
            "reqBodyType": "formData",
            "bodyType": "json"
        ])
        var tmp: [String: Any] = try await callApi(params as! AlibabacloudOpenApi.Params, req as! AlibabacloudOpenApi.OpenApiRequest, runtime as! TeaUtils.RuntimeOptions)
        return Tea.TeaConverter.fromMap(WithdrawPublishedRouteEntriesResponse(), tmp)
    }

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    public func withdrawPublishedRouteEntries(_ request: WithdrawPublishedRouteEntriesRequest) async throws -> WithdrawPublishedRouteEntriesResponse {
        var runtime: TeaUtils.RuntimeOptions = TeaUtils.RuntimeOptions([:])
        return try await withdrawPublishedRouteEntriesWithOptions(request as! WithdrawPublishedRouteEntriesRequest, runtime as! TeaUtils.RuntimeOptions)
    }
}
